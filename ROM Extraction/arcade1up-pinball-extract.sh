#!/bin/bash

MD5_LIST=(
  22bb217596afc85943cf62a0df311013 # 20210830_pinball_wms_release_1920x1080_1G-5b.img
  3267505d90c55bae87d742c9152b4fa6 # 20210830_pinball_swp_release_1920x1080_1G-5b.img
  766c35a29838f22fdc74002223f42be7 # 20210830_pinball_mvp_release_1920x1080_1G-5b.img
)

missing-dependency() {
  echo "This script requires $1 to be installed."
  echo "On a Debian / Ubuntu machine, this can be installed by running:"
  echo
  echo "  sudo apt install $1"
  echo
  exit 1
}

missing-dependency-awimage() {
  echo "This script requires awimage to be installed."
  echo "Please place awimage in the same directory as this script, then try again."
  echo
  echo "awimage can be compiled from: https://github.com/Ithamar/awutils"
  echo
  exit 1
}

print-usage() {
  echo "$1"
  echo
  echo "Usage: $0 <firmware-image>"
  echo
  echo "  <firmware-image> is the path to a firmware image from"
  echo "  the firmware update zip file."
  exit 1
}

#####################################################################################

[[ $# -eq 0 || $1 = "--help" || $1 = "-h" ]] && \
  print-usage "Extracts APKs from Arcade1Up pinball firmware images."

IMG_PATH=$(realpath "$1")
[[ ! -f "$IMG_PATH" ]] && print-usage "Firmware image path is incorrect."
[[ $(head -c8 "$IMG_PATH" | grep IMAGEWTY) != IMAGEWTY ]] && \
  print-usage "Specified file is not a valid Allwinner firmware image."

echo "Checking dependencies..."
SCRIPT_DIR=$(pwd $(dirname "$0"))
[[ ! -f "$SCRIPT_DIR/awimage" ]] && missing-dependency-awimage
[[ -z $(which simg2img) ]] && missing-dependency simg2img
[[ -z $(which guestmount) ]] && missing-dependency libguestfs-tools

echo "Verifying firmware..."
IMG_MD5=$(md5sum "$IMG_PATH" | cut -d" " -f1)

for i in ${MD5_LIST[@]}; do
  [[ $i = $IMG_MD5 ]] && VERIFIED=1
done

if [[ $VERIFIED != 1 ]]; then
  echo
  echo "Firmware image is not verified to work with this script."
  echo "You may continue to run it, but it may not work as expected."
  echo "Press Enter to continue or CTRL+C to quit..."
  read _
fi

echo "Initializing directories..."
WORKING_DIR=/tmp/.arcade1up
rm -rf "$WORKING_DIR"
mkdir -p "$WORKING_DIR/mnt"
mkdir -p "$WORKING_DIR/apks"

START_DIR="$PWD"
cd "$WORKING_DIR"

echo "Extracting firmware image using awimage..."
cp "$SCRIPT_DIR/awimage" .
chmod +x awimage
./awimage "$IMG_PATH" firmware >/dev/null 2>&1

echo "Unsparsifying firmware image using simg2img..."
simg2img firmware/RFSFAT16_SYSTEM_FEX000000 firmware/raw.img

echo "Mounting firmware image using guestmount..."
guestmount -a firmware/raw.img -m /dev/sda --ro mnt

echo "Locating games inside firmware image..."
cd "$WORKING_DIR/mnt/app"
for i in MVP SWP WMS; do
  [[ -f "$i/$i.apk" ]] && echo "Extracting $i.apk..." && cp "$i/$i.apk" "$WORKING_DIR/apks"
done

echo "Cleaning up..."
cd "$START_DIR"
mv "$WORKING_DIR/apks"/* .
umount "$WORKING_DIR/mnt"
rm -r "$WORKING_DIR"
rm -r /var/tmp/.guestfs-$UID

echo "Done!"
