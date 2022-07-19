#!/bin/bash

MD5_LIST=(
  35c711a43ff21e6634cf136618d95566 # Release_0.dll
  92934b771109d8073cf85038548c9dcd # Release_1.dll
  d6f27e05e97c39d9aa4f9032c14c22ce # Release_2.dll
  e55329760178c2dc654cbe17648dc4c4 # Release_3.dll
)

extract-rom() {
  WORKING_FILE="$DLL_PATH"
  case $1 in
    Release_0.dll) # Dig Dug
      extract-file 136007.110 $((0x1D9F0)) $((0x100))
      extract-file dd1.10b    $((0x1DAF0)) $((0x1000))
      extract-file 136007.113 $((0x1EAF0)) $((0x20))
      extract-file 136007.111 $((0x1EB10)) $((0x100))
      extract-file 136007.112 $((0x1EC10)) $((0x100))
      extract-file dd1.15     $((0x1ED10)) $((0x1000))
      extract-file dd1.14     $((0x1FD10)) $((0x1000))
      extract-file dd1.13     $((0x20D10)) $((0x1000))
      extract-file dd1.12     $((0x21D10)) $((0x1000))
      extract-file dd1.9      $((0x22D10)) $((0x800))
      extract-file dd1.11     $((0x23510)) $((0x1000))
      extract-file dd1.7      $((0x35420)) $((0x1000))
      extract-file dd1a.5     $((0x36420)) $((0x1000))
      extract-file dd1a.6     $((0x37420)) $((0x1000))
      extract-file dd1a.1     $((0x38420)) $((0x1000))
      extract-file dd1a.2     $((0x39420)) $((0x1000))
      extract-file dd1a.3     $((0x3A420)) $((0x1000))
      extract-file dd1a.4     $((0x3B420)) $((0x1000))
      dummy-file   136007.109              $((0x100))
      package-zip  digdug.zip
    ;;

    Release_1.dll) # Galaga
      extract-file prom-1.1d $((0x56710)) $((0x100))
      extract-file prom-5.5n $((0x56810)) $((0x20))
      extract-file prom-3.1c $((0x56830)) $((0x100))
      extract-file prom-4.2n $((0x56930)) $((0x100))
      extract-file gg1_11.4d $((0x56A30)) $((0x1000))
      extract-file gg1_10.4f $((0x57A30)) $((0x1000))
      extract-file gg1_9.4l  $((0x58A30)) $((0x1000))
      extract-file gg1_7b.2c $((0x64A00)) $((0x1000))
      extract-file gg1_5b.3f $((0x65A00)) $((0x1000))
      extract-file gg1_1b.3p $((0x66A00)) $((0x1000))
      extract-file gg1_2b.3m $((0x67A00)) $((0x1000))
      extract-file gg1_3.2m  $((0x68A00)) $((0x1000))
      extract-file gg1_4b.2l $((0x69A00)) $((0x1000))
      dummy-file   prom-2.5c              $((0x100))
      package-zip  galaga.zip
    ;;

    Release_2.dll) # Ms. Pac-Man
      check-unusable && (
        extract-file 82s126.1m $((0x1AE30)) $((0x100))
        extract-file 82s123.7f $((0x1AF30)) $((0x20))
        extract-file 82s126.4a $((0x1AF50)) $((0x100))
        extract-file 5f        $((0x1B050)) $((0x1000))
      # extract-file 5e        $((0x1C050)) $((0x1000)) # alternate ROM?
        extract-file 5e        $((0x1D050)) $((0x1000))
        extract-file boot1     $((0x28C20)) $((0x1000))
        extract-file boot2     $((0x29C20)) $((0x1000))
        extract-file boot3     $((0x2AC20)) $((0x1000))
        extract-file boot4     $((0x2BC20)) $((0x1000))
        extract-file boot5     $((0x30C20)) $((0x1000))
        extract-file boot6     $((0x31C20)) $((0x1000))
        dummy-file   82s126.3m              $((0x100))
        package-zip  mspacmab.zip
      )
    ;;

    Release_3.dll) # Pac-Man
      extract-file 82s126.1m $((0x1AA30)) $((0x100))
      extract-file 82s123.7f $((0x1AB30)) $((0x20))
      extract-file 82s126.4a $((0x1AB50)) $((0x100))
      extract-file pacman.5f $((0x1AC50)) $((0x1000))
      extract-file pacman.5e $((0x1C050)) $((0x1000))
      extract-file pacman.6e $((0x28020)) $((0x1000))
      extract-file pacman.6f $((0x29020)) $((0x1000))
      extract-file pacman.6h $((0x2A020)) $((0x1000))
      extract-file pacman.6j $((0x2B020)) $((0x1000))
      dummy-file   82s126.3m              $((0x100))
      package-zip  pacman.zip
    ;;
  esac
}

extract-file() {
  dd if="$WORKING_FILE" of="$WORKING_DIR/roms/$1" skip=$2 count=$3 status=none iflag=skip_bytes,count_bytes
}

dummy-file() {
  dd if=/dev/zero of="$WORKING_DIR/roms/$1" count=$2 status=none iflag=count_bytes
}

package-zip() {
  cd "$WORKING_DIR/roms"
  zip -q "$WORKING_DIR/zips/$1" *
  rm *
  cd "$GAMES_DIR"
}

check-unusable() {
  [[ $EXTRACT_ALL != 1 ]] && return 1
  [[ $EXTRACT_ALL = 1 ]] && \
    echo "Note: "$(basename "$WORKING_FILE")" produces an unusable ROM" && return 0
}

missing-dependency() {
  echo "This script requires $1 to be installed."
  echo "On a Debian / Ubuntu machine, this can be installed by running:"
  echo
  echo "  sudo apt install $1"
  echo
  exit 1
}

print-usage() {
  echo "$1"
  echo
  echo "Usage: $0 <release-dll> [-a]"
  echo
  echo "  <release-dll> is the path to a \"Release_<x>.dll\" file inside"
  echo "  the \"Plugins\" folder of the Arcade Game Series data folder."
  echo
  echo "  -a option extracts all ROMs, including unusable ones."
  exit 1
}

#####################################################################################

[[ $# -eq 0 || $1 = "--help" || $1 = "-h" ]] && \
  print-usage "Extracts ROMs from the Arcade Game Series, available on Steam."

DLL_PATH=$(realpath "$1")
[[ ! -f "$DLL_PATH" ]] && print-usage "DLL path is incorrect."
[[ $2 = "-a" ]] && EXTRACT_ALL=1

echo "Checking dependencies..."
SCRIPT_DIR=$(pwd $(dirname "$0"))

[[ -z $(which zip) ]] && missing-dependency zip

echo "Verifying DLL..."
DLL_MD5=$(md5sum "$DLL_PATH" | cut -d" " -f1)

for i in ${MD5_LIST[@]}; do
  [[ $i = $DLL_MD5 ]] && VERIFIED=1
done

if [[ $VERIFIED != 1 ]]; then
  echo
  echo "This DLL is not verified to work with this script."
  echo "You may continue to run it, but it may not work as expected."
  echo "Press Enter to continue or CTRL+C to quit..."
  read _
fi

echo "Initializing directories..."
WORKING_DIR=/tmp/.namco-ags
rm -rf "$WORKING_DIR"
mkdir -p "$WORKING_DIR/roms"
mkdir -p "$WORKING_DIR/zips"

START_DIR="$PWD"
cd "$WORKING_DIR"

if [[ $EXTRACT_ALL != 1 && "$DLL_PATH" = *Release_2.dll ]]; then
  echo
  echo "Unfortunately, Ms. Pac-Man from the Arcade Game Series is"
  echo "not usable with emulators. If you would like to extract"
  echo "it anyway, re-run this script with the [-a] option."
  echo

  rm -r "$WORKING_DIR"
  exit 1
fi

for i in $(basename "$DLL_PATH"); do
  echo "Extracting $i..." && extract-rom $i
done

echo "Cleaning up..."
cd "$START_DIR"
mv "$WORKING_DIR/zips"/* .
rm -r "$WORKING_DIR"

echo "Done!"
