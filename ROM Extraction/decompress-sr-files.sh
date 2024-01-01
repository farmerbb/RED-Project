#!/bin/bash

[[ ! -f offzip ]] && \
  echo "Please compile and place the offzip program in the current directory, alongside your SR files." && \
  echo "offzip can be downloaded from: http://aluigi.altervista.org/mytoolz/offzip.zip" && \
  exit 1

chmod +x ./offzip

for i in *.SR *.sr; do
  [[ ! -f $i ]] && continue

  echo "Decompressing $i..."
  DIR=$(echo $i | sed -e "s/.SR//" -e "s/.sr//")
  mkdir -p $DIR
  rm -rf $DIR/*

  NUM_OF_ENTRIES=$(strings $i | head -n1 | cut -d' ' -f1)
  INITIAL_OFFSET=$(strings $i | head -n1 | cut -d' ' -f3)

  FILENAMES=($(strings $i | tail -n +2 | head -n $NUM_OF_ENTRIES | awk '{$1=$1};1' | cut -d' ' -f6))
  OFFSETS=($(strings $i | tail -n +2 | head -n $NUM_OF_ENTRIES | awk '{$1=$1};1' | cut -d' ' -f1))
  SIZES=($(strings $i | tail -n +2 | head -n $NUM_OF_ENTRIES | awk '{$1=$1};1' | cut -d' ' -f2))

  for n in $(seq 0 $(($NUM_OF_ENTRIES - 1))); do
    dd if=$i of=$DIR/${FILENAMES[$n]} skip=$(($INITIAL_OFFSET + ${OFFSETS[$n]})) count=${SIZES[$n]} status=none iflag=skip_bytes,count_bytes
  done

  for ext in qz QZ; do
    [[ -n "$(find $DIR -maxdepth 1 -type f -name "*.$ext" -print -quit)" ]] || continue

    for qz in $(ls -1 $DIR/*.$ext); do
      ./offzip -Q -o -a $qz $DIR 0 > /dev/null
      mv $DIR/00000004.* $(echo $qz | sed "s/.$ext//") >/dev/null 2>&1 && rm $qz
    done
  done
done
