#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <input-file> [output-file-without-extension]"
  exit 1
fi

INPUT="$1"
BASENAME="${2:-${INPUT%.*}}"

# Read first 4 bytes (filename length, little-endian 32-bit)
FILENAME_LEN=$(od -An -t u4 -N4 -v "$INPUT" | tr -d ' ')

# Round up to next multiple of 4
PADDED_FILENAME_LEN=$(( (FILENAME_LEN + 3) & ~3 ))

# Offset where data length field begins
DATA_LEN_OFFSET=$(( 4 + PADDED_FILENAME_LEN ))

# Read 4-byte data length
DATA_LEN=$(od -An -t u4 -j "$DATA_LEN_OFFSET" -N4 -v "$INPUT" | tr -d ' ')

# Data starts after:
# 4 bytes (filename length)
# padded filename
# 4 bytes (data length)
DATA_OFFSET=$(( DATA_LEN_OFFSET + 4 ))

# Extract data to temporary file first
TMP_FILE=$(mktemp)
dd if="$INPUT" of="$TMP_FILE" bs=1 skip="$DATA_OFFSET" count="$DATA_LEN" status=none

# Binary-safe magic check
if head -c 3 "$TMP_FILE" | cmp -s - <(printf 'NES'); then
  EXT="nes"
else
  EXT="sfc"
fi

OUTPUT="${BASENAME}.${EXT}"
mv "$TMP_FILE" "$OUTPUT"

echo "Extracted $DATA_LEN bytes to $OUTPUT"
