#!/bin/bash
# Extract files from an RPF archive (Activision resource pack format)
#
# RPF is a simple resource archive used by Activision compilations
# (e.g., Activision Anthology for PS2) to bundle ROM files, cover art,
# manuals, and screenshots.
#
# Requires only GNU coreutils (dd, od, tr, stat, head, mkdir)
#
# Format reference and QuickBMS implementation by Edness:
# https://github.com/EdnessP/scripts/blob/main/other/activisionRPF.bms

ALIGNMENT=64
HEADER_SIZE=64
DIR_ENTRY_SIZE=84

# Read a little-endian uint32 from file $1 at byte offset $2
read-u32le() {
    local b0 b1 b2 b3
    read -r b0 b1 b2 b3 <<< "$(od -An -tu1 -j "$2" -N 4 "$1")"
    echo $(( b0 + b1 * 256 + b2 * 65536 + b3 * 16777216 ))
}

# Read a null-terminated string from file $1 at offset $2, max length $3
read-string() {
    dd if="$1" skip="$2" count="$3" iflag=skip_bytes,count_bytes status=none \
        | tr '\0' '\n' | head -1
}

# Round $1 up to the next ALIGNMENT boundary
align() {
    echo $(( ($1 + ALIGNMENT - 1) / ALIGNMENT * ALIGNMENT ))
}

print-usage() {
    echo "Extract files from an RPF archive (Activision resource pack format)"
    echo ""
    echo "Usage: $(basename "$0") <archive.rpf> [output_directory]"
}

###########################################################

if [[ $# -lt 1 ]]; then
    print-usage
    exit 1
fi

WORKING_FILE=$(realpath "$1")
OUTPUT_DIR=${2:-.}

if [[ ! -f "$WORKING_FILE" ]]; then
    echo "Error: File not found: $WORKING_FILE" >&2
    exit 1
fi

ACTUAL_SIZE=$(stat -c%s "$WORKING_FILE")
if [[ $ACTUAL_SIZE -lt $HEADER_SIZE ]]; then
    echo "Error: File too small to be a valid RPF archive" >&2
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

# Parse header
FILE_SIZE=$(read-u32le "$WORKING_FILE" 0)
ENTRY_COUNT=$(read-u32le "$WORKING_FILE" 4)
DATA_SECTION_SIZE=$(read-u32le "$WORKING_FILE" $((0x20)))

if [[ $FILE_SIZE -ne $ACTUAL_SIZE ]]; then
    echo "Warning: header file_size ($FILE_SIZE) != actual ($ACTUAL_SIZE)" >&2
fi

DATA_START=$(( HEADER_SIZE + ENTRY_COUNT * DIR_ENTRY_SIZE ))
POS=0

for (( i = 0; i < ENTRY_COUNT; i++ )); do
    ENTRY_BASE=$(( HEADER_SIZE + i * DIR_ENTRY_SIZE ))

    CONTENT_SIZE=$(read-u32le "$WORKING_FILE" "$ENTRY_BASE")
    FILENAME=$(read-string "$WORKING_FILE" $(( ENTRY_BASE + 0x14 )) 64)

    dd if="$WORKING_FILE" of="$OUTPUT_DIR/$FILENAME" \
        skip=$(( DATA_START + POS )) count="$CONTENT_SIZE" \
        iflag=skip_bytes,count_bytes status=none

    echo "$FILENAME ($CONTENT_SIZE bytes)"

    POS=$(( POS + CONTENT_SIZE ))

    # Check for MSVC debug-heap 0xFD padding before the next entry
    if [[ $i -lt $(( ENTRY_COUNT - 1 )) ]]; then
        MARKER=$(od -An -tx1 -j $(( DATA_START + POS )) -N 4 "$WORKING_FILE" | tr -d ' ')
        if [[ "$MARKER" = "fdfdfdfd" ]]; then
            POS=$(align $(( POS + 4 )))
        elif [[ $(( CONTENT_SIZE % ALIGNMENT )) -ne 0 ]]; then
            BYTE=$(od -An -tu1 -j $(( DATA_START + POS )) -N 1 "$WORKING_FILE" | tr -d ' ')
            if [[ "$BYTE" = "253" ]]; then
                POS=$(align "$POS")
            fi
        fi
    fi
done

echo "Extracted $ENTRY_COUNT files to $OUTPUT_DIR"
