#!/bin/bash

ROM_LIST=(
  contra.rom
  Frogger.rom
  Gyruss.rom
  RushNAttack.rom
  Scramble.rom
  Supercontra.rom
  TimePilot.rom
  TrackAndField.rom
  YieArKungFu.rom
)

MD5_LIST=(
  094dc6223cb8da773f53d0e6ebdeb7aa # Contra
  10ff61c9f1e57239acf8a402ec9dfdb2 # Track and Field
  385164fe0eb34174ffd160ab98e4898d # Yie Ar Kung-Fu
  72566a62a16aebe5f42c183d10af0bcb # Scramble
  8f9f430355477cc9a480d8498b8221de # Time Pilot
  97af60f8bdf8c3785b027bb46dc52b4e # Super Contra
  9f2b8cbf6197a442e64213bc2c8d2d01 # Rush'n Attack
  b972e1c15c73eb00606e3b378a0e1c82 # Frogger
  ba6754ebc31c4a98eb303b314753aa46 # Gyruss
)

extract-rom() {
  WORKING_FILE=$1
  case $1 in
    contra.rom)
      extract-file      633i03.18a            $((0x0))      $((0x10000))
      extract-file      633i02.17a            $((0x10000))  $((0x10000))
      extract-file      633e01.12a            $((0x20000))  $((0x8000))
      extract-file      633e04.7d+633e05.7f   $((0x28000))  $((0x80000))
      extract-file      633e06.16d+633e07.16f $((0xA8000))  $((0x80000))
      extract-file      633e08.10g            $((0x128000)) $((0x100))
      extract-file      633e09.12g            $((0x128100)) $((0x100))
      extract-file      633f10.18g            $((0x128200)) $((0x100))
      extract-file      633f11.20g            $((0x128300)) $((0x100))
      deinterleave-file 633e04.7d+633e05.7f
      deinterleave-file 633e06.16d+633e07.16f
      package-zip       contra1.zip
    ;;

    Frogger.rom)
      extract-file frogger.26  $((0x0))    $((0x1000))
      extract-file frogger.27  $((0x1000)) $((0x1000))
      extract-file frsm3.7     $((0x2000)) $((0x1000))
      extract-file frogger.608 $((0x3000)) $((0x800))
      extract-file frogger.609 $((0x3800)) $((0x800))
      extract-file frogger.610 $((0x4000)) $((0x800))
      extract-file frogger.606 $((0x4800)) $((0x800))
      extract-file frogger.607 $((0x5000)) $((0x800))
      extract-file pr-91.6l    $((0x5800)) $((0x20))
      package-zip  frogger.zip
    ;;

    Gyruss.rom)
      extract-file gyrussk.1   $((0x0))     $((0x2000))
      extract-file gyrussk.2   $((0x2000))  $((0x2000))
      extract-file gyrussk.3   $((0x4000))  $((0x2000))
      extract-file gyrussk.1a  $((0x6000))  $((0x2000))
      extract-file gyrussk.2a  $((0x8000))  $((0x2000))
      extract-file gyrussk.9   $((0xA000))  $((0x2000))
      extract-file gyrussk.3a  $((0xC000))  $((0x1000))
      extract-file gyrussk.4   $((0xD000))  $((0x2000))
      extract-file gyrussk.6   $((0xF000))  $((0x2000))
      extract-file gyrussk.5   $((0x11000)) $((0x2000))
      extract-file gyrussk.8   $((0x13000)) $((0x2000))
      extract-file gyrussk.7   $((0x15000)) $((0x2000))
      extract-file gyrussk.pr3 $((0x17000)) $((0x20))
      extract-file gyrussk.pr1 $((0x17020)) $((0x100))
      extract-file gyrussk.pr2 $((0x17120)) $((0x100))
      package-zip  gyruss.zip
    ;;

    RushNAttack.rom)
      extract-file 577h03.10c   $((0x0))     $((0x4000))
      extract-file 577h02.8c    $((0x4000))  $((0x4000))
      extract-file 577h01.7c    $((0x8000))  $((0x4000))
      extract-file 577h07.3f    $((0xC000))  $((0x4000))
      extract-file 577l06.5e    $((0x10000)) $((0x4000))
      extract-file 577h05.4e    $((0x14000)) $((0x4000))
      extract-file 577l08.4f    $((0x18000)) $((0x4000))
      extract-file 577l04.3e    $((0x1C000)) $((0x4000))
      extract-file 577h09.2f    $((0x20000)) $((0x20))
      extract-file 577h10.5f    $((0x20020)) $((0x100))
      extract-file 577h11.6f    $((0x20120)) $((0x100))
      package-zip  rushatck.zip
    ;;

    Scramble.rom)
      extract-file s1.2d        $((0x0))    $((0x800))
      extract-file s2.2e        $((0x0800)) $((0x800))
      extract-file s3.2f        $((0x1000)) $((0x800))
      extract-file s4.2h        $((0x1800)) $((0x800))
      extract-file s5.2j        $((0x2000)) $((0x800))
      extract-file s6.2l        $((0x2800)) $((0x800))
      extract-file s7.2m        $((0x3000)) $((0x800))
      extract-file s8.2p        $((0x3800)) $((0x800))
      extract-file ot1.5c       $((0x4000)) $((0x800))
      extract-file ot2.5d       $((0x4800)) $((0x800))
      extract-file ot3.5e       $((0x5000)) $((0x800))
      extract-file c2.5f        $((0x5800)) $((0x800))
      extract-file c1.5h        $((0x6000)) $((0x800))
      extract-file c01s.6e      $((0x6800)) $((0x20))
      package-zip  scramble.zip
    ;;

    Supercontra.rom)
      extract-file            775-e02.k11                                       $((0x0))      $((0x10000))
      extract-file            775-e03.k13                                       $((0x10000))  $((0x10000))
      extract-file            775-c01.bin                                       $((0x20000))  $((0x8000))
      extract-file            775-a08e.3f+775-a08a.4f+775-a07e.5f+775-a07a.6f   $((0x28000))  $((0x80000))
      extract-file            775-f08g.3d+775-f08c.4d+775-f07g.5d+775-f07c.6d   $((0xA8000))  $((0x40000))
      extract-file            775-f08h.7c+775-f08d.7d+775-f07h.7e+775-f07d.7f   $((0xE8000))  $((0x40000))
      extract-file            775-a05a.11f+775-a05e.10f+775-a06a.9f+775-a06e.8f $((0x128000)) $((0x40000))
      extract-file            775-a05b.11e+775-a05f.10e+775-a06b.9e+775-a06f.8e $((0x168000)) $((0x40000))
      extract-file            775-f05c.11d+775-f05g.10d+775-f06c.9d+775-f06g.8d $((0x1A8000)) $((0x40000))
      extract-file            775-f05d.11c+775-f05h.10c+775-f06d.9c+775-f06h.8c $((0x1E8000)) $((0x40000))
      extract-file            775-a04a.11b                                      $((0x228000)) $((0x10000))
      extract-file            775-a04b.10b                                      $((0x238000)) $((0x10000))
      extract-file            775-a04c.9b                                       $((0x248000)) $((0x10000))
      extract-file            775-a04d.8b                                       $((0x258000)) $((0x10000))
      extract-file            775-f04e.11a                                      $((0x268000)) $((0x10000))
      extract-file            775-f04f.10a                                      $((0x278000)) $((0x10000))
      extract-file            775-f04g.9a                                       $((0x288000)) $((0x10000))
      extract-file            775-f04h.8a                                       $((0x298000)) $((0x10000))
      dummy-file              775a09.b19                                                      $((0x100))
      deinterleave-file-32bit 775-a08e.3f+775-a08a.4f+775-a07e.5f+775-a07a.6f
      deinterleave-file-32bit 775-f08g.3d+775-f08c.4d+775-f07g.5d+775-f07c.6d
      deinterleave-file-32bit 775-f08h.7c+775-f08d.7d+775-f07h.7e+775-f07d.7f
      deinterleave-file-32bit 775-a05a.11f+775-a05e.10f+775-a06a.9f+775-a06e.8f
      deinterleave-file-32bit 775-a05b.11e+775-a05f.10e+775-a06b.9e+775-a06f.8e
      deinterleave-file-32bit 775-f05c.11d+775-f05g.10d+775-f06c.9d+775-f06g.8d
      deinterleave-file-32bit 775-f05d.11c+775-f05h.10c+775-f06d.9c+775-f06h.8c
      package-zip             scontra.zip
    ;;

    TimePilot.rom)
      extract-file tm1         $((0x0))    $((0x2000))
      extract-file tm2         $((0x2000)) $((0x2000))
      extract-file tm3         $((0x4000)) $((0x2000))
      extract-file tm7         $((0x6000)) $((0x1000))
      extract-file tm6         $((0x7000)) $((0x2000))
      extract-file tm4         $((0x9000)) $((0x2000))
      extract-file tm5         $((0xB000)) $((0x2000))
      extract-file timeplt.b4  $((0xD000)) $((0x20))
      extract-file timeplt.b5  $((0xD020)) $((0x20))
      extract-file timeplt.e9  $((0xD040)) $((0x100))
      extract-file timeplt.e12 $((0xD140)) $((0x100))
      package-zip  timeplt.zip
    ;;

    TrackAndField.rom)
      extract-file a01_e01.bin  $((0x0))     $((0x2000))
      extract-file a02_e02.bin  $((0x2000))  $((0x2000))
      extract-file a03_k03.bin  $((0x4000))  $((0x2000))
      extract-file a04_e04.bin  $((0x6000))  $((0x2000))
      extract-file a05_e05.bin  $((0x8000))  $((0x2000))
      extract-file c2_d13.bin   $((0xA000))  $((0x2000))
      extract-file h16_e12.bin  $((0xC000))  $((0x2000))
      extract-file h15_e11.bin  $((0xE000))  $((0x2000))
      extract-file h14_e10.bin  $((0x10000)) $((0x2000))
      extract-file c11_d06.bin  $((0x12000)) $((0x2000))
      extract-file c12_d07.bin  $((0x14000)) $((0x2000))
      extract-file c13_d08.bin  $((0x16000)) $((0x2000))
      extract-file c14_d09.bin  $((0x18000)) $((0x2000))
      extract-file 361b16.f1    $((0x1A000)) $((0x20))
      extract-file 361b17.b16   $((0x1A020)) $((0x100))
      extract-file 361b18.e15   $((0x1A120)) $((0x100))
      extract-file c9_d15.bin   $((0x1A220)) $((0x2000))
      package-zip  trackfld.zip
    ;;

    YieArKungFu.rom)
      extract-file 407_i08.10d $((0x0))     $((0x4000))
      extract-file 407_i07.8d  $((0x4000))  $((0x4000))
      extract-file 407_c01.6h  $((0x8000))  $((0x2000))
      extract-file 407_c02.7h  $((0xA000))  $((0x2000))
      extract-file 407_d05.16h $((0xC000))  $((0x4000))
      extract-file 407_d06.17h $((0x10000)) $((0x4000))
      extract-file 407_d03.14h $((0x14000)) $((0x4000))
      extract-file 407_d04.15h $((0x18000)) $((0x4000))
      extract-file 407c10.1g   $((0x1C000)) $((0x20))
      extract-file 407_c09.8b  $((0x1C020)) $((0x2000))
      package-zip  yiear.zip
    ;;
  esac
}

extract-file() {
  dd if="$WORKING_FILE" of="$WORKING_DIR/roms/$1" skip=$2 count=$3 status=none iflag=skip_bytes,count_bytes
}

dummy-file() {
  dd if=/dev/zero of="$WORKING_DIR/roms/$1" count=$2 status=none iflag=count_bytes
}

deinterleave-file() {
  FILE1=$(echo $1 | cut -d+ -f1)
  FILE2=$(echo $1 | cut -d+ -f2)
  python3 "$SCRIPT_DIR/ts_rom_tool.py" -deinterleave "$WORKING_DIR/roms/$1" "$WORKING_DIR/roms/$FILE1" "$WORKING_DIR/roms/$FILE2"
  rm "$WORKING_DIR/roms/$1"
}

deinterleave-file-32bit() {
  FILE1_32BIT=$(echo $1 | cut -d+ -f1)
  FILE2_32BIT=$(echo $1 | cut -d+ -f2)
  FILE3_32BIT=$(echo $1 | cut -d+ -f3)
  FILE4_32BIT=$(echo $1 | cut -d+ -f4)

  mv "$WORKING_DIR/roms/$1" "$WORKING_DIR/roms/1and3+2and4"
  deinterleave-file 1and3+2and4

  mv "$WORKING_DIR/roms/1and3" "$WORKING_DIR/roms/$FILE1_32BIT+$FILE3_32BIT"
  deinterleave-file $FILE1_32BIT+$FILE3_32BIT

  mv "$WORKING_DIR/roms/2and4" "$WORKING_DIR/roms/$FILE2_32BIT+$FILE4_32BIT"
  deinterleave-file $FILE2_32BIT+$FILE4_32BIT
}

package-zip() {
  cd "$WORKING_DIR/roms"
  zip -q "$WORKING_DIR/zips/$1" *
  rm *
  cd "$SCRIPT_DIR"
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

missing-dependency-extract360() {
  echo "This script requires extract360.py to be installed."
  echo "Please place extract360.py in the same directory as this script, then try again."
  echo
  echo "extract360.py can be obtained from: https://github.com/rene0/xbox360"
  echo
  exit 1
}

print-usage() {
  echo "$1"
  echo
  echo "Usage: $0 <path-to-game> [-a]"
  echo
  echo "  <path-to-game> is the path to the XBLA game copied from your console."
  echo "  These can be found on your USB drive within the \"Content\" directory."
  echo
  echo "  -a option extracts all ROMs, including unusable ones."
  exit 1
}

#####################################################################################

[[ $# -eq 0 || $1 = "--help" || $1 = "-h" ]] && \
  print-usage "Extracts arcade ROMs from Konami XBLA games."

STFS_PATH=$(realpath "$1")
[[ ! -f "$STFS_PATH" ]] && print-usage "XBLA game path is incorrect."
[[ $2 = "-a" ]] && EXTRACT_ALL=1

echo "Checking dependencies..."
SCRIPT_DIR=$(pwd $(dirname "$0"))

[[ ! -f "$SCRIPT_DIR/ts_rom_tool.py" ]] && missing-dependency-tsromtool
[[ ! -f "$SCRIPT_DIR/extract360.py" ]] && missing-dependency-extract360
[[ -z $(which zip) ]] && missing-dependency zip
[[ -z $(which python2) ]] && missing-dependency python2
[[ -z $(which python3) ]] && missing-dependency python3

echo "Verifying file..."
STFS_MD5=$(dd if="$STFS_PATH" skip=$((0x971A)) status=none iflag=skip_bytes | md5sum | cut -d" " -f1)

for i in ${MD5_LIST[@]}; do
  [[ $i = $STFS_MD5 ]] && VERIFIED=1
done

if [[ $VERIFIED != 1 ]]; then
  echo
  echo "This XBLA title is not verified to work with this script."
  echo "You may continue to run it, but it may not work as expected."
  echo "Press Enter to continue or CTRL+C to quit..."
  read _
fi

echo "Initializing directories..."
WORKING_DIR=/tmp/.konami-xbla
rm -rf "$WORKING_DIR"
mkdir -p "$WORKING_DIR/roms"
mkdir -p "$WORKING_DIR/zips"

START_DIR="$PWD"
cd "$WORKING_DIR"

if [[ $EXTRACT_ALL != 1 && $STFS_MD5 = ba6754ebc31c4a98eb303b314753aa46 ]]; then
  echo
  echo "Unfortunately, Gyruss is not usable with emulators. If you would"
  echo "like to extract it anyway, re-run this script with the [-a] option."
  echo

  rm -r "$WORKING_DIR"
  exit 1
fi

echo "Extracting STFS container..."
cp "$STFS_PATH" stfs
python2 "$SCRIPT_DIR/extract360.py" stfs >/dev/null 2>&1

cd stfs.dir/classic
for i in ${ROM_LIST[@]}; do
  [[ -f $i ]] && echo "Extracting $i..." && extract-rom $i
done

echo "Cleaning up..."
cd "$START_DIR"
mv "$WORKING_DIR/zips"/* .
rm -r "$WORKING_DIR"

echo "Done!"
