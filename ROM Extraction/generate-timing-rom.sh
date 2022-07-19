#!/bin/bash

# Generates timing ROMs used in various Namco arcade games.
# Needed in order to get Xevious and Super Xevious working.

timing-rom() {
  ROM="$1"
  append-bytes '\x0F\x0D\x0F\x0F' 16 "$ROM"
  append-bytes '\x07'             1  "$ROM"
  append-bytes '\x0F\x0E\x0D\x0F' 5  "$ROM"
  append-bytes '\x0F\x0F\x0B\x07' 1  "$ROM"
  append-bytes '\x0F\x0E\x0D\x0F' 4  "$ROM"
  append-bytes '\x0F\x0F\x0B\x07' 1  "$ROM"
  append-bytes '\x0F\x0E\x0D\x0F' 4  "$ROM"
  append-bytes '\x0F\x0F\x0B'     1  "$ROM"
  truncate -s 256 "$ROM"
}

append-bytes() {
  for i in $(seq $2); do
    echo -n -e $1 >> "$3"
  done
}

[[ $# -eq 1 ]] && rm -f "$1" && timing-rom "$1"
