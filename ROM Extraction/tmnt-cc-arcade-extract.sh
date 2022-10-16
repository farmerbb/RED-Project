#!/bin/bash

ROM_LIST=(
  TeenageMutantNinjaTurtles
  TeenageMutantNinjaTurtles2
)

extract-rom() {
  WORKING_FILE="$START_DIR/$1"
  cd "$WORKING_FILE"

  case $1 in
    TeenageMutantNinjaTurtles)
      split-file                                      tmnt.maincpu         $((0x40000))
      split-file                                      tmnt.k051960         $((0x100000))
      split-file                                      tmnt.proms           $((0x100))
      patch-file                                      tmnt.maincpu.split0  $((0x15A0))
      dummy-file              963a25.d5                                    $((0x80000))
      copy-file               963e20.g13              tmnt.audiocpu
      copy-file               963a30.g7               tmnt.proms.split0
      copy-file               963a31.g19              tmnt.proms.split1
      copy-file               963a26.c13              tmnt.k007232
      copy-file               963a27.d18              tmnt.upd
      deinterleave-file       963-x23.j17+963-x24.k17 tmnt.maincpu.split0
      deinterleave-file       963-x21.j15+963-x22.k15 tmnt.maincpu.split1
      deinterleave-file-16bit 963a28.h27+963a29.k27   tmnt.k052109
      deinterleave-file-16bit 963a17.h4+963a15.k4     tmnt.k051960.split0
      deinterleave-file-16bit 963a18.h6+963a16.k6     tmnt.k051960.split1
      package-zip             tmnt.zip

      split-file                                      tmntj.maincpu        $((0x40000))
      patch-file                                      tmntj.maincpu.split0 $((0x15A8))
      deinterleave-file       963_223.j17+963_224.k17 tmntj.maincpu.split0
      deinterleave-file       963_221.j15+963_222.k15 tmntj.maincpu.split1
      package-zip             tmntj.zip
    ;;

    TeenageMutantNinjaTurtles2)
      split-file                                        tmnt2.maincpu        $((0x40000))
      split-file                                        tmnt2.k053245        $((0x200000))
      patch-file                                        tmnt2.maincpu.split0 $((0x19FA))
      copy-file               063b01.2f                 tmnt2.audiocpu
      copy-file               063b06.1d                 tmnt2.k053260
      copy-file               tmnt2_uaa.nv              tmnt2.eeprom
      deinterleave-file       063uaa02.8e+063uaa03.8g   tmnt2.maincpu.split0
      deinterleave-file       063uaa04.10e+063uaa05.10g tmnt2.maincpu.split1
      deinterleave-file-16bit 063b12.16k+063b11.12k     tmnt2.k052109
      deinterleave-file-16bit 063b09.7l+063b07.3l       tmnt2.k053245.split0
      deinterleave-file-16bit 063b10.7k+063b08.3k       tmnt2.k053245.split1
      package-zip             tmnt2.zip
    ;;
  esac
}

split-file() {
  python3 "$SCRIPT_DIR/ts_rom_tool.py" -split $1 $2 $1.split
}

copy-file() {
  dd if="$2" of="$WORKING_DIR/roms/$1" status=none
}

dummy-file() {
  dd if=/dev/zero of="$WORKING_DIR/roms/$1" count=$2 status=none iflag=count_bytes
}

patch-file() {
  printf "$(printf '\\x%02X' $((0x60)))" | dd of="$1" bs=1 seek=$2 count=1 conv=notrunc &> /dev/null
}

deinterleave-file() {
  FILE1=$(echo $1 | cut -d+ -f1)
  FILE2=$(echo $1 | cut -d+ -f2)
  python3 "$SCRIPT_DIR/ts_rom_tool.py" -deinterleave $2 "$WORKING_DIR/roms/$FILE1" "$WORKING_DIR/roms/$FILE2"
}

deinterleave-file-16bit() {
  FILE1_16BIT=$(echo $1 | cut -d+ -f1)
  FILE2_16BIT=$(echo $1 | cut -d+ -f2)

  deinterleave-file 1and3+2and4 $2

  mv "$WORKING_DIR/roms/1and3" .
  deinterleave-file 1+3 1and3

  mv "$WORKING_DIR/roms/2and4" .
  deinterleave-file 2+4 2and4

  python3 "$SCRIPT_DIR/ts_rom_tool.py" -interleave "$WORKING_DIR/roms/1" "$WORKING_DIR/roms/2" "$WORKING_DIR/roms/$FILE1_16BIT"
  python3 "$SCRIPT_DIR/ts_rom_tool.py" -interleave "$WORKING_DIR/roms/3" "$WORKING_DIR/roms/4" "$WORKING_DIR/roms/$FILE2_16BIT"

  rm "$WORKING_DIR/roms/1"
  rm "$WORKING_DIR/roms/2"
  rm "$WORKING_DIR/roms/3"
  rm "$WORKING_DIR/roms/4"
  rm 1and3
  rm 2and4
}

package-zip() {
  cd "$WORKING_DIR/roms"
  zip -q "$WORKING_DIR/zips/$1" *
  rm *
  rm "$WORKING_FILE"/*.split*
  cd - > /dev/null
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
  echo "Extracts arcade ROMs from the TMNT Cowabunga Collection."
  echo
  echo "Place this script in the roms/Konami folder from your extracted assets.pie."
  echo "To extract assets.pie, please use the Cowabunga tool, which can be obtained from:"
  echo
  echo "https://github.com/Masquerade64/Cowabunga"
  echo
  exit 1
}

#####################################################################################

[[ ! -d TeenageMutantNinjaTurtles ]] && print-usage

echo "Checking dependencies..."
SCRIPT_DIR=$(pwd $(dirname "$0"))

[[ ! -f "$SCRIPT_DIR/ts_rom_tool.py" ]] && missing-dependency-tsromtool
[[ -z $(which zip) ]] && missing-dependency zip
[[ -z $(which python3) ]] && missing-dependency python3

echo "Initializing directories..."
WORKING_DIR=/tmp/.tmnt-cc-arcade
rm -rf "$WORKING_DIR"
mkdir -p "$WORKING_DIR/roms"
mkdir -p "$WORKING_DIR/zips"

START_DIR="$PWD"
cd "$WORKING_DIR"

for i in ${ROM_LIST[@]}; do
  [[ -d "$START_DIR"/$i ]] && echo "Extracting $i..." && extract-rom $i
done

echo "Cleaning up..."
cd "$START_DIR"
mv "$WORKING_DIR/zips"/* .
rm -r "$WORKING_DIR"

echo "Done!"
