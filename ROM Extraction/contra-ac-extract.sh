#!/bin/bash

MD5_LIST=(
  d9255086fadc4179b9298e7e9d9787bc
)

extract-rom() {
  WORKING_FILE="$EXE_PATH"

  extract-file      633i02.17a            $((0x27ED60)) $((0x10000))
  extract-file      633i03.18a-1          $((0x28ED60)) $((0x8000))
  extract-file      633e01.12a            $((0x296DD0)) $((0x8000))
  extract-file      633f10.18g            $((0x29EDD0)) $((0x100))
  extract-file      633e09.12g            $((0x2BEED0)) $((0x100))
  extract-file      633f11.20g            $((0x2BEED0)) $((0x100))
  extract-file      633e08.10g            $((0x2BEFD0)) $((0x100))
  extract-file      633i03.18a-2          $((0x2D70D0)) $((0x8000))
  extract-file      633e06.16d+633e07.16f $((0x2E71D0)) $((0x80000))
  extract-file      633e04.7d+633e05.7f   $((0x3671D0)) $((0x80000))
  concatenate-files 633i03.18a
  deinterleave-file 633e06.16d+633e07.16f
  deinterleave-file 633e04.7d+633e05.7f
  package-zip       contra1.zip

  extract-file      633e01.12a            $((0x296DD0)) $((0x8000))
  extract-file      633f10.18g            $((0x29EDD0)) $((0x100))
  extract-file      633e09.12g            $((0x2BEED0)) $((0x100))
  extract-file      633f11.20g            $((0x2BEED0)) $((0x100))
  extract-file      633e08.10g            $((0x2BEFD0)) $((0x100))
  extract-file      633k02.17a            $((0x2BF0D0)) $((0x10000))
  extract-file      633n03.18a-1          $((0x2CF0D0)) $((0x8000))
  extract-file      633n03.18a-2          $((0x2DF0D0)) $((0x8000))
  extract-file      633e06.16d+633e07.16f $((0x2E71D0)) $((0x80000))
  extract-file      633e04.7d+633e05.7f   $((0x3671D0)) $((0x80000))
  concatenate-files 633n03.18a
  deinterleave-file 633e06.16d+633e07.16f
  deinterleave-file 633e04.7d+633e05.7f
  package-zip       contraj.zip

  extract-file      633e01.12a            $((0x296DD0)) $((0x8000))
  extract-file      633f10.18g            $((0x29EDD0)) $((0x100))
  extract-file      633g3.17a             $((0x29EED0)) $((0x10000))
  extract-file      633g2.18a             $((0x2AEED0)) $((0x10000))
  extract-file      633e09.12g            $((0x2BEED0)) $((0x100))
  extract-file      633f11.20g            $((0x2BEED0)) $((0x100))
  extract-file      633e08.10g            $((0x2BEFD0)) $((0x100))
  extract-file      633e06.16d+633e07.16f $((0x2E71D0)) $((0x80000))
  extract-file      633e04.7d+633e05.7f   $((0x3671D0)) $((0x80000))
  deinterleave-file 633e06.16d+633e07.16f
  deinterleave-file 633e04.7d+633e05.7f
  package-zip       gryzor1.zip

  check-unusable scontra.zip && (
    extract-file 775-e02.k11  $((0x467360)) $((0x10000))
    extract-file 775-e03.k13  $((0x477360)) $((0x10000))
    extract-file 775-c01.bin  $((0x487360)) $((0x8000))
    extract-file 775-a04a.11b $((0x4AF360)) $((0x10000))
    extract-file 775-a04b.10b $((0x4BF360)) $((0x10000)) # DAT mismatch
    extract-file 775-a04c.9b  $((0x4CF360)) $((0x10000))
    extract-file 775-a04d.8b  $((0x4DF360)) $((0x10000))
    extract-file 775-f04e.11a $((0x4EF360)) $((0x10000))
    extract-file 775-f04f.10a $((0x4FF360)) $((0x10000)) # DAT mismatch
    extract-file 775-f04g.9a  $((0x50F360)) $((0x10000))
    extract-file 775-f04h.8a  $((0x51F360)) $((0x10000))
    package-zip  scontra.zip
  )

  check-unusable scontraj.zip && (
    extract-file 775-c01.bin  $((0x487360)) $((0x8000))
    extract-file 775-f02.bin  $((0x48F360)) $((0x10000))
    extract-file 775-f03.bin  $((0x49F360)) $((0x10000))
    extract-file 775-a04a.bin $((0x4AF360)) $((0x10000))
    extract-file 775-a04b.bin $((0x4BF360)) $((0x10000)) # DAT mismatch
    extract-file 775-a04c.bin $((0x4CF360)) $((0x10000))
    extract-file 775-a04d.bin $((0x4DF360)) $((0x10000))
    extract-file 775-f04e.bin $((0x4EF360)) $((0x10000))
    extract-file 775-f04f.bin $((0x4FF360)) $((0x10000)) # DAT mismatch
    extract-file 775-f04g.bin $((0x50F360)) $((0x10000))
    extract-file 775-f04h.bin $((0x51F360)) $((0x10000))
    package-zip  scontraj.zip
  )
}

extract-file() {
  dd if="$WORKING_FILE" of="$WORKING_DIR/roms/$1" skip=$2 count=$3 status=none iflag=skip_bytes,count_bytes
}

deinterleave-file() {
  FILE1=$(echo $1 | cut -d+ -f1)
  FILE2=$(echo $1 | cut -d+ -f2)
  python3 "$SCRIPT_DIR/ts_rom_tool.py" -deinterleave "$WORKING_DIR/roms/$1" "$WORKING_DIR/roms/$FILE1" "$WORKING_DIR/roms/$FILE2"
  rm "$WORKING_DIR/roms/$1"
}

concatenate-files() {
  python3 "$SCRIPT_DIR/ts_rom_tool.py" -concat "$WORKING_DIR/roms/$1-1" "$WORKING_DIR/roms/$1-2" "$WORKING_DIR/roms/$1"
  rm "$WORKING_DIR/roms/$1-1"
  rm "$WORKING_DIR/roms/$1-2"
}

package-zip() {
  cd "$WORKING_DIR/roms"
  zip -q "$WORKING_DIR/zips/$1" *
  rm *
  cd "$SCRIPT_DIR"
}

check-unusable() {
  [[ $EXTRACT_ALL != 1 ]] && return 1
  [[ $EXTRACT_ALL = 1 ]] && \
    BASENAME=$(basename "$WORKING_FILE") && \
    echo "Note: $BASENAME produces an unusable ROM ($1)" && return 0
}

missing-dependency() {
  echo "This script requires $1 to be installed."
  echo "On a Debian / Ubuntu machine, this can be installed by running:"
  echo
  echo "  sudo apt install $1"
  echo
  exit 1
}

missing-dependency-tsromtool() {
  echo "This script requires ts_rom_tool.py to be installed."
  echo "Please place ts_rom_tool.py in the same directory as this script, then try again."
  echo
  echo "ts_rom_tool.py can be obtained from: https://github.com/twistedsymphony/ts_rom_tool"
  echo
  exit 1
}

print-usage() {
  echo "$1"
  echo
  echo "Usage: $0 <path-to-exe> [-a]"
  echo
  echo "  <path-to-exe> is the path to the \"game.exe\" file inside the game folder."
  echo "  Currently only the Steam version is supported."
  echo
  echo "  -a option extracts all ROMs, including unusable ones."
  exit 1
}

#####################################################################################

[[ $# -eq 0 || $1 = "--help" || $1 = "-h" ]] && \
  print-usage "Extracts arcade ROMs from the Contra Anniversary Collection."

EXE_PATH=$(realpath "$1")
[[ ! -f "$EXE_PATH" ]] && print-usage "EXE path is incorrect."
[[ $2 = "-a" ]] && EXTRACT_ALL=1

echo "Checking dependencies..."
SCRIPT_DIR=$(pwd $(dirname "$0"))

[[ ! -f "$SCRIPT_DIR/ts_rom_tool.py" ]] && missing-dependency-tsromtool
[[ -z $(which zip) ]] && missing-dependency zip
[[ -z $(which python3) ]] && missing-dependency python3

echo "Verifying EXE..."
EXE_MD5=$(md5sum "$EXE_PATH" | cut -d" " -f1)

for i in ${MD5_LIST[@]}; do
  [[ $i = $EXE_MD5 ]] && VERIFIED=1
done

if [[ $VERIFIED != 1 ]]; then
  echo
  echo "This EXE is not verified to work with this script."
  echo "You may continue to run it, but it may not work as expected."
  echo "Press Enter to continue or CTRL+C to quit..."
  read _
fi

echo "Initializing directories..."
WORKING_DIR=/tmp/.contra-ac
rm -rf "$WORKING_DIR"
mkdir -p "$WORKING_DIR/roms"
mkdir -p "$WORKING_DIR/zips"

START_DIR="$PWD"
cd "$WORKING_DIR"

echo "Extracting $(basename "$EXE_PATH")..."
extract-rom

echo "Cleaning up..."
cd "$START_DIR"
mv "$WORKING_DIR/zips"/* .
rm -r "$WORKING_DIR"

echo "Done!"
