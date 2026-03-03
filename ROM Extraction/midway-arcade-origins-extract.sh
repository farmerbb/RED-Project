#!/bin/bash

extract-file() {
  dd if=$1 skip=$3 count=$4 status=none iflag=skip_bytes,count_bytes >> roms/$2
}

deinterleave-file() {
  dd if=$1 skip=$4 count=$5 status=none iflag=skip_bytes,count_bytes | od -An -v -t o1 -w2 > .tmp-file
  cat .tmp-file | sed 's/^ \([0-7]*\) \([0-7]*\).*/printf \\\\\1/' | sh >> roms/$2
  cat .tmp-file | sed 's/^ \([0-7]*\) \([0-7]*\).*/printf \\\\\2/' | sh >> roms/$3
  rm .tmp-file
}

dummy-file() {
  dd if=/dev/zero count=$2 status=none iflag=count_bytes >> roms/$1
}

package-zip() {
  cd roms
  rm -f ../../$1
  zip -q ../../$1 *
  cd ..
}

extract-rom() {
  case $1 in
    _720)
      deinterleave-file _720_a.t11   136047-3126.7lm 136047-3127.7mn $((0x0))     $((0x8000))
      deinterleave-file _720_a.t11   136047-3128.6fh 136047-4131.6mn $((0x8000))  $((0x20000))
      deinterleave-file _720_a.t11   136047-1129.6hj 136047-1132.6p  $((0x28000)) $((0x20000))
      deinterleave-file _720_a.t11   136047-1130.6k  136047-1133.6r  $((0x48000)) $((0x20000))

      extract-file      _720_a.6502  136047-2134.2a                  $((0x0))     $((0x4000))
      extract-file      _720_a.6502  136047-1135.2b                  $((0x4000))  $((0x4000))
      extract-file      _720_a.6502  136047-2136.2cd                 $((0x8000))  $((0x4000))

      extract-file      _720.pfrom   136047-1121.6a                  $((0x0))     $((0x8000))
      extract-file      _720.pfrom   136047-1122.6b                  $((0x8000))  $((0x8000))
      extract-file      _720.pfrom   136047-1123.7a                  $((0x10000)) $((0x8000))
      extract-file      _720.pfrom   136047-1124.7b                  $((0x18000)) $((0x8000))
      extract-file      _720.pfrom   136047-1117.6c                  $((0x20000)) $((0x8000))
      extract-file      _720.pfrom   136047-1118.6d                  $((0x28000)) $((0x8000))
      extract-file      _720.pfrom   136047-1119.7d                  $((0x30000)) $((0x8000))
      extract-file      _720.pfrom   136047-1120.7c                  $((0x38000)) $((0x8000))

      extract-file      _720.mobrom  136047-1109.6t                  $((0x20000)) $((0x8000))
      extract-file      _720.mobrom  136047-1109.6t                  $((0x0))     $((0x8000))
      extract-file      _720.mobrom  136047-1110.6sr                 $((0x28000)) $((0x8000))
      extract-file      _720.mobrom  136047-1110.6sr                 $((0x8000))  $((0x8000))
      extract-file      _720.mobrom  136047-1111.6p                  $((0x30000)) $((0x8000))
      extract-file      _720.mobrom  136047-1111.6p                  $((0x10000)) $((0x8000))
      extract-file      _720.mobrom  136047-1112.6n                  $((0x38000)) $((0x8000))
      extract-file      _720.mobrom  136047-1112.6n                  $((0x18000)) $((0x8000))
      extract-file      _720.mobrom  136047-1113.6m                  $((0x60000)) $((0x8000))
      extract-file      _720.mobrom  136047-1113.6m                  $((0x40000)) $((0x8000))
      extract-file      _720.mobrom  136047-1114.6l                  $((0x68000)) $((0x8000))
      extract-file      _720.mobrom  136047-1114.6l                  $((0x48000)) $((0x8000))
      extract-file      _720.mobrom  136047-1115.6kj                 $((0x70000)) $((0x8000))
      extract-file      _720.mobrom  136047-1115.6kj                 $((0x50000)) $((0x8000))
      extract-file      _720.mobrom  136047-1116.6jh                 $((0x78000)) $((0x8000))
      extract-file      _720.mobrom  136047-1116.6jh                 $((0x58000)) $((0x8000))
      extract-file      _720.mobrom  136047-1101.5t                  $((0xA0000)) $((0x8000))
      extract-file      _720.mobrom  136047-1101.5t                  $((0x80000)) $((0x8000))
      extract-file      _720.mobrom  136047-1102.5sr                 $((0xA8000)) $((0x8000))
      extract-file      _720.mobrom  136047-1102.5sr                 $((0x88000)) $((0x8000))
      extract-file      _720.mobrom  136047-1103.5p                  $((0xB0000)) $((0x8000))
      extract-file      _720.mobrom  136047-1103.5p                  $((0x90000)) $((0x8000))
      extract-file      _720.mobrom  136047-1104.5n                  $((0xB8000)) $((0x8000))
      extract-file      _720.mobrom  136047-1104.5n                  $((0x98000)) $((0x8000))
      extract-file      _720.mobrom  136047-1105.5m                  $((0xE0000)) $((0x8000))
      extract-file      _720.mobrom  136047-1105.5m                  $((0xC0000)) $((0x8000))
      extract-file      _720.mobrom  136047-1106.5l                  $((0xE8000)) $((0x8000))
      extract-file      _720.mobrom  136047-1106.5l                  $((0xC8000)) $((0x8000))
      extract-file      _720.mobrom  136047-1107.5kj                 $((0xF0000)) $((0x8000))
      extract-file      _720.mobrom  136047-1107.5kj                 $((0xD0000)) $((0x8000))
      extract-file      _720.mobrom  136047-1108.5jh                 $((0xF8000)) $((0x8000))
      extract-file      _720.mobrom  136047-1108.5jh                 $((0xD8000)) $((0x8000))

      extract-file      _720_a.anrom 136047-1125.4t                  $((0x0))     $((0x4000))

      dummy-file                     720-eeprom.bin                               $((0x200))
      package-zip                    720.zip
    ;;

    ABEAST16)
      deinterleave-file ABEAST16_V.68K         epr-11705.a7 epr-11704.a5 $((0x0))     $((0x40000))

      extract-file      ABEAST16_V_TILES.ROM   opr-11674.a14             $((0x0))     $((0x20000))
      extract-file      ABEAST16_V_TILES.ROM   opr-11675.a15             $((0x20000)) $((0x20000))
      extract-file      ABEAST16_V_TILES.ROM   opr-11676.a16             $((0x40000)) $((0x20000))

      deinterleave-file ABEAST16_V_SPRITES.ROM epr-11681.b5 epr-11677.b1 $((0x0))     $((0x40000))
      deinterleave-file ABEAST16_V_SPRITES.ROM epr-11682.b6 epr-11678.b2 $((0x40000)) $((0x40000))
      deinterleave-file ABEAST16_V_SPRITES.ROM epr-11683.b7 epr-11679.b3 $((0x80000)) $((0x40000))
      deinterleave-file ABEAST16_V_SPRITES.ROM epr-11684.b8 epr-11680.b4 $((0xC0000)) $((0x40000))

      # epr-11686.a10 is already decrypted and matches epr-11671.a10 from other Altered Beast sets.
      # Despite this, MAME tries to decrypt it anyway and runs the game without sound.
      # An altered MAME driver is needed in order to run the game correctly with working sound.
      extract-file      ABEAST16_V_SOUND.ROM   epr-11686.a10             $((0x0))     $((0x8000))
      extract-file      ABEAST16_V_SOUND.ROM   opr-11672.a11             $((0x8000))  $((0x20000))
      extract-file      ABEAST16_V_SOUND.ROM   opr-11673.a12             $((0x28000)) $((0x20000))

      dummy-file                               317-0066.key                           $((0x2000))
      dummy-file                               315-5298.b9                            $((0xEB))
      package-zip                              altbeast2.nosound.zip
    ;;

    apb)
      deinterleave-file apb_a.t11  136051-2126.7l 136051-2127.7n $((0x0))     $((0x8000))
      deinterleave-file apb_a.t11  136051-7128.6f 136051-7129.6n $((0x8000))  $((0x20000))
      deinterleave-file apb_a.t11  136051-1130.6j 136051-1131.6p $((0x28000)) $((0x20000))
      deinterleave-file apb_a.t11  136051-1132.6l 136051-1133.6s $((0x48000)) $((0x20000))

      extract-file      apb_a.6502 136051-5134.2a                $((0x0))     $((0x4000))
      extract-file      apb_a.6502 136051-5135.2bc               $((0x4000))  $((0x4000))
      extract-file      apb_a.6502 136051-5136.2d                $((0x8000))  $((0x4000))

      extract-file      apb.pfrom  136051-1118.6a                $((0x0))     $((0x8000))
      extract-file      apb.pfrom  136051-1120.6bc               $((0x28000)) $((0x8000))
      extract-file      apb.pfrom  136051-1120.6bc               $((0x8000))  $((0x8000))
      extract-file      apb.pfrom  136051-1122.7a                $((0x30000)) $((0x8000))
      extract-file      apb.pfrom  136051-1122.7a                $((0x10000)) $((0x8000))
      extract-file      apb.pfrom  136051-1124.7bc               $((0x38000)) $((0x8000))
      extract-file      apb.pfrom  136051-1124.7bc               $((0x18000)) $((0x8000))
      extract-file      apb.pfrom  136051-1117.6cd               $((0x40000)) $((0x8000))
      extract-file      apb.pfrom  136051-1119.6de               $((0x68000)) $((0x8000))
      extract-file      apb.pfrom  136051-1119.6de               $((0x48000)) $((0x8000))
      extract-file      apb.pfrom  136051-1121.7de               $((0x70000)) $((0x8000))
      extract-file      apb.pfrom  136051-1121.7de               $((0x50000)) $((0x8000))
      extract-file      apb.pfrom  136051-1123.7cd               $((0x78000)) $((0x8000))
      extract-file      apb.pfrom  136051-1123.7cd               $((0x58000)) $((0x8000))

      extract-file      apb.mobrom 136051-1105.6t                $((0x20000)) $((0x8000))
      extract-file      apb.mobrom 136051-1105.6t                $((0x0))     $((0x8000))
      extract-file      apb.mobrom 136051-1106.6rs               $((0x28000)) $((0x8000))
      extract-file      apb.mobrom 136051-1106.6rs               $((0x8000))  $((0x8000))
      extract-file      apb.mobrom 136051-1107.6pr               $((0x30000)) $((0x8000))
      extract-file      apb.mobrom 136051-1107.6pr               $((0x10000)) $((0x8000))
      extract-file      apb.mobrom 136051-1108.6n                $((0x38000)) $((0x8000))
      extract-file      apb.mobrom 136051-1108.6n                $((0x18000)) $((0x8000))
      extract-file      apb.mobrom 136051-1113.6m                $((0x60000)) $((0x8000))
      extract-file      apb.mobrom 136051-1113.6m                $((0x40000)) $((0x8000))
      extract-file      apb.mobrom 136051-1114.6kl               $((0x68000)) $((0x8000))
      extract-file      apb.mobrom 136051-1114.6kl               $((0x48000)) $((0x8000))
      extract-file      apb.mobrom 136051-1115.6jk               $((0x70000)) $((0x8000))
      extract-file      apb.mobrom 136051-1115.6jk               $((0x50000)) $((0x8000))
      extract-file      apb.mobrom 136051-1116.6h                $((0x78000)) $((0x8000))
      extract-file      apb.mobrom 136051-1116.6h                $((0x58000)) $((0x8000))
      extract-file      apb.mobrom 136051-1101.5t                $((0xA0000)) $((0x8000))
      extract-file      apb.mobrom 136051-1101.5t                $((0x80000)) $((0x8000))
      extract-file      apb.mobrom 136051-1102.5rs               $((0xA8000)) $((0x8000))
      extract-file      apb.mobrom 136051-1102.5rs               $((0x88000)) $((0x8000))
      extract-file      apb.mobrom 136051-1103.5pr               $((0xB0000)) $((0x8000))
      extract-file      apb.mobrom 136051-1103.5pr               $((0x90000)) $((0x8000))
      extract-file      apb.mobrom 136051-1104.5n                $((0xB8000)) $((0x8000))
      extract-file      apb.mobrom 136051-1104.5n                $((0x98000)) $((0x8000))
      extract-file      apb.mobrom 136051-1109.5m                $((0xE0000)) $((0x8000))
      extract-file      apb.mobrom 136051-1109.5m                $((0xC0000)) $((0x8000))
      extract-file      apb.mobrom 136051-1110.5kl               $((0xE8000)) $((0x8000))
      extract-file      apb.mobrom 136051-1110.5kl               $((0xC8000)) $((0x8000))
      extract-file      apb.mobrom 136051-1111.5jk               $((0xF0000)) $((0x8000))
      extract-file      apb.mobrom 136051-1111.5jk               $((0xD0000)) $((0x8000))
      extract-file      apb.mobrom 136051-1112.5h                $((0xF8000)) $((0x8000))
      extract-file      apb.mobrom 136051-1112.5h                $((0xD8000)) $((0x8000))

      extract-file      apb.anrom  136051-1125.4t                $((0x0))     $((0x4000))

      package-zip                  apb.zip
    ;;

    archrivals)
      deinterleave-file archrivals.68k    arch_rivals_3c_rev4.3c arch_rivals_3b_rev4.3b $((0x0))     $((0x20000))
      deinterleave-file archrivals.68k    arch_rivals_2c_rev4.2c arch_rivals_2b_rev4.2b $((0x20000)) $((0x20000))

      extract-file      archrivals.6809   arch_rivals_u4_rev1.u4                        $((0x0))     $((0x8000))
      extract-file      archrivals.6809   arch_rivals_u19_rev1.u19                      $((0x8000))  $((0x8000))
      extract-file      archrivals.6809   arch_rivals_u20_rev1.u20                      $((0x10000)) $((0x8000))

      extract-file      archrivals.1.grom arch_rivals_11d_rev1.11d                      $((0x0))     $((0x10000))
      extract-file      archrivals.1.grom arch_rivals_12d_rev1.12d                      $((0x10000)) $((0x10000))

      extract-file      archrivals.2.grom arch_rivals_7j_rev1.7j                        $((0x0))     $((0x20000))
      extract-file      archrivals.2.grom arch_rivals_8j_rev1.8j                        $((0x20000)) $((0x20000))
      extract-file      archrivals.2.grom arch_rivals_9j_rev1.9j                        $((0x40000)) $((0x20000))
      extract-file      archrivals.2.grom arch_rivals_10j_rev1.10j                      $((0x60000)) $((0x20000))

      dummy-file                          pls153.11j                                                 $((0xEB))
      dummy-file                          pls153.12j                                                 $((0xEB))
      dummy-file                          pls153.14h                                                 $((0xEB))
      package-zip                         archrivl.zip
    ;;

    bubbles)
      extract-file bubbles.6800 video_sound_rom_5_std_771.ic12 $((0x0))    $((0x1000))

      extract-file bubbles.6809 bubbles_rom_10b_16-3012-49.a7  $((0x0))    $((0x1000))
      extract-file bubbles.6809 bubbles_rom_11b_16-3012-50.c7  $((0x1000)) $((0x1000))
      extract-file bubbles.6809 bubbles_rom_12b_16-3012-51.e7  $((0x2000)) $((0x1000))
      extract-file bubbles.6809 bubbles_rom_1b_16-3012-40.4e   $((0x3000)) $((0x1000))
      extract-file bubbles.6809 bubbles_rom_2b_16-3012-41.4c   $((0x4000)) $((0x1000))
      extract-file bubbles.6809 bubbles_rom_3b_16-3012-42.4a   $((0x5000)) $((0x1000))
      extract-file bubbles.6809 bubbles_rom_4b_16-3012-43.5e   $((0x6000)) $((0x1000))
      extract-file bubbles.6809 bubbles_rom_5b_16-3012-44.5c   $((0x7000)) $((0x1000))
      extract-file bubbles.6809 bubbles_rom_6b_16-3012-45.5a   $((0x8000)) $((0x1000))
      extract-file bubbles.6809 bubbles_rom_7b_16-3012-46.6e   $((0x9000)) $((0x1000))
      extract-file bubbles.6809 bubbles_rom_8b_16-3012-47.6c   $((0xA000)) $((0x1000))
      extract-file bubbles.6809 bubbles_rom_9b_16-3012-48.6a   $((0xB000)) $((0x1000))

      dummy-file                decoder_rom_4.3g                           $((0x200))
      dummy-file                decoder_rom_6.3c                           $((0x200))
      package-zip               bubbles.zip
    ;;

    championshipsprint)
      deinterleave-file championshipsprint_a.t11  136045-3126.7l 136045-2127.7n $((0x0))     $((0x8000))
      deinterleave-file championshipsprint_a.t11  136045-2125.6f 136045-2122.6n $((0x8000))  $((0x10000))
      deinterleave-file championshipsprint_a.t11  136045-1124.6k 136045-1121.6r $((0x18000)) $((0x10000))
      deinterleave-file championshipsprint_a.t11  136045-1123.6l 136045-1120.6s $((0x28000)) $((0x10000))

      extract-file      championshipsprint_a.6502 136045-1118.2bc               $((0x0))     $((0x4000))
      extract-file      championshipsprint_a.6502 136045-1119.2d                $((0x4000))  $((0x4000))

      extract-file      championshipsprint.pfrom  136045-1105.6a                $((0x0))     $((0x8000))
      extract-file      championshipsprint.pfrom  136045-1106.6b                $((0x8000))  $((0x8000))
      extract-file      championshipsprint.pfrom  136045-1101.7a                $((0x30000)) $((0x8000))
      extract-file      championshipsprint.pfrom  136045-1101.7a                $((0x10000)) $((0x8000))
      extract-file      championshipsprint.pfrom  136045-1102.7b                $((0x18000)) $((0x8000))
      extract-file      championshipsprint.pfrom  136045-1107.6c                $((0x40000)) $((0x8000))
      extract-file      championshipsprint.pfrom  136045-1108.6de               $((0x48000)) $((0x8000))
      extract-file      championshipsprint.pfrom  136045-1104.7de               $((0x70000)) $((0x8000))
      extract-file      championshipsprint.pfrom  136045-1104.7de               $((0x50000)) $((0x8000))
      extract-file      championshipsprint.pfrom  136045-1103.7c                $((0x58000)) $((0x8000))

      extract-file      championshipsprint.mobrom 136045-1112.6l                $((0x0))     $((0x8000))
      extract-file      championshipsprint.mobrom 136045-1111.6k                $((0x8000))  $((0x8000))
      extract-file      championshipsprint.mobrom 136045-1110.6hj               $((0x10000)) $((0x8000))
      extract-file      championshipsprint.mobrom 136045-1109.6fh               $((0x18000)) $((0x8000))
      extract-file      championshipsprint.mobrom 136045-1116.6rs               $((0x20000)) $((0x8000))
      extract-file      championshipsprint.mobrom 136045-1115.6pr               $((0x28000)) $((0x8000))
      extract-file      championshipsprint.mobrom 136045-1114.6n                $((0x30000)) $((0x8000))
      extract-file      championshipsprint.mobrom 136045-1113.6m                $((0x38000)) $((0x8000))


      extract-file      championshipsprint.anrom  136045-1117.6t                $((0x0))     $((0x4000))

      dummy-file                                  csprint-eeprom.bin                         $((0x200))
      package-zip                                 csprint.zip
    ;;

    defender)
      extract-file defender.6800   video_sound_rom_1.ic12 $((0x0))    $((0x800))

      extract-file defender_a.6809 defend.1               $((0x0))    $((0x800))
      extract-file defender_a.6809 defend.4               $((0x800))  $((0x800))
      extract-file defender_a.6809 defend.2               $((0x1000)) $((0x1000))
      extract-file defender_a.6809 defend.3               $((0x2000)) $((0x1000))
      extract-file defender_a.6809 defend.9               $((0x3000)) $((0x800))
      extract-file defender_a.6809 defend.12              $((0x3800)) $((0x800))
      extract-file defender_a.6809 defend.8               $((0x4000)) $((0x800))
      extract-file defender_a.6809 defend.11              $((0x4800)) $((0x800))
      extract-file defender_a.6809 defend.7               $((0x5000)) $((0x800))
      extract-file defender_a.6809 defend.10              $((0x5800)) $((0x800))
      extract-file defender_a.6809 defend.6               $((0x6000)) $((0x800))

      dummy-file                   decoder.2                          $((0x200))
      dummy-file                   decoder.3                          $((0x200))
      package-zip                  defender.zip
    ;;

    gauntlet)
      deinterleave-file gauntlet.68k    136037-1307.9a 136037-1308.9b $((0x8000))  $((0x8000))
      deinterleave-file gauntlet.68k    136037-1307.9a 136037-1308.9b $((0x0))     $((0x8000))

      deinterleave-file gauntlet.2.68k  136037-205.10a 136037-206.10b $((0x0))     $((0x8000))
      deinterleave-file gauntlet.2.68k  136037-1409.7a 136037-1410.7b $((0x10000)) $((0x8000))
      deinterleave-file gauntlet.2.68k  136037-1409.7a 136037-1410.7b $((0x8000))  $((0x8000))

      extract-file      gauntlet.6502   136037-120.16r                $((0x0))     $((0x4000))
      extract-file      gauntlet.6502   136037-119.16s                $((0x4000))  $((0x8000))

      extract-file      gauntlet.1.grom 136037-104.6p                 $((0x0))     $((0x2000))

      extract-file      gauntlet.2.grom 136037-111.1a                 $((0x0))     $((0x8000))
      extract-file      gauntlet.2.grom 136037-112.1b                 $((0x8000))  $((0x8000))
      extract-file      gauntlet.2.grom 136037-113.1l                 $((0x10000)) $((0x8000))
      extract-file      gauntlet.2.grom 136037-114.1mn                $((0x18000)) $((0x8000))
      extract-file      gauntlet.2.grom 136037-115.2a                 $((0x20000)) $((0x8000))
      extract-file      gauntlet.2.grom 136037-116.2b                 $((0x28000)) $((0x8000))
      extract-file      gauntlet.2.grom 136037-117.2l                 $((0x30000)) $((0x8000))
      extract-file      gauntlet.2.grom 136037-118.2mn                $((0x38000)) $((0x8000))

      dummy-file                        74s472-136037-101.7u                       $((0x200))
      dummy-file                        74s472-136037-102.5l                       $((0x200))
      dummy-file                        74s287-136037-103.4r                       $((0x100))
      package-zip                       gauntlet.zip
    ;;

    gauntlet2)
      deinterleave-file gauntlet2_4a.68k    136037-1307.9a 136037-1308.9b   $((0x8000))  $((0x8000))
      deinterleave-file gauntlet2_4a.68k    136037-1307.9a 136037-1308.9b   $((0x0))     $((0x8000))

      deinterleave-file gauntlet2_4a.2.68k  136043-1105.10a 136043-1106.10b $((0x0))     $((0x8000))
      deinterleave-file gauntlet2_4a.2.68k  136043-1109.7a 136043-1110.7b   $((0x10000)) $((0x8000))
      deinterleave-file gauntlet2_4a.2.68k  136043-1109.7a 136043-1110.7b   $((0x8000))  $((0x8000))
      deinterleave-file gauntlet2_4a.2.68k  136043-1121.6a 136043-1122.6b   $((0x20000)) $((0x8000))
      deinterleave-file gauntlet2_4a.2.68k  136043-1121.6a 136043-1122.6b   $((0x18000)) $((0x8000))

      extract-file      gauntlet2.6502   136043-1120.16r                    $((0x0))     $((0x4000))
      extract-file      gauntlet2.6502   136043-1119.16s                    $((0x4000))  $((0x8000))

      extract-file      gauntlet2.1.grom 136043-1104.6p                     $((0x0))     $((0x2000))

      extract-file      gauntlet2.2.grom 136043-1111.1a                     $((0x0))     $((0x8000))
      extract-file      gauntlet2.2.grom 136037-112.1b                      $((0x8000))  $((0x8000))
      extract-file      gauntlet2.2.grom 136043-1123.1c                     $((0x10000)) $((0x4000))
      extract-file      gauntlet2.2.grom 136043-1113.1l                     $((0x18000)) $((0x8000))
      extract-file      gauntlet2.2.grom 136037-114.1mn                     $((0x20000)) $((0x8000))
      extract-file      gauntlet2.2.grom 136043-1124.1p                     $((0x28000)) $((0x4000))
      extract-file      gauntlet2.2.grom 136043-1115.2a                     $((0x30000)) $((0x8000))
      extract-file      gauntlet2.2.grom 136037-116.2b                      $((0x38000)) $((0x8000))
      extract-file      gauntlet2.2.grom 136043-1125.2c                     $((0x40000)) $((0x4000))
      extract-file      gauntlet2.2.grom 136043-1117.2l                     $((0x48000)) $((0x8000))
      extract-file      gauntlet2.2.grom 136037-118.2mn                     $((0x50000)) $((0x8000))
      extract-file      gauntlet2.2.grom 136043-1126.2p                     $((0x58000)) $((0x4000))

      dummy-file                         74s472-136037-101.7u                            $((0x200))
      dummy-file                         74s472-136037-102.5l                            $((0x200))
      dummy-file                         82s129-136043-1103.4r                           $((0x100))
      package-zip                        gaunt2.zip
    ;;

    GAXE16)
      # epr-12523.a7 and epr-12522.a5 do not match MAME.
      # Single-byte differences scattered throughout.
      deinterleave-file GoldenAxeProgram.rom epr-12523.a7 epr-12522.a5 $((0x0))      $((0x40000))
      deinterleave-file GoldenAxeProgram.rom epr-12521.a8 epr-12519.a6 $((0x40000))  $((0x40000))

      extract-file      GoldenAxeChars.rom   epr-12385.a14             $((0x0))      $((0x20000))
      extract-file      GoldenAxeChars.rom   epr-12386.a15             $((0x20000))  $((0x20000))
      extract-file      GoldenAxeChars.rom   epr-12387.a16             $((0x40000))  $((0x20000))

      deinterleave-file GoldenAxeSprites.rom mpr-12379.b5 mpr-12378.b1 $((0x0))      $((0x40000))
      deinterleave-file GoldenAxeSprites.rom mpr-12379.b5 mpr-12378.b1 $((0x100000)) $((0x40000))
      deinterleave-file GoldenAxeSprites.rom mpr-12381.b6 mpr-12380.b2 $((0x40000))  $((0x40000))
      deinterleave-file GoldenAxeSprites.rom mpr-12381.b6 mpr-12380.b2 $((0x140000)) $((0x40000))
      deinterleave-file GoldenAxeSprites.rom mpr-12383.b7 mpr-12382.b3 $((0x80000))  $((0x40000))
      deinterleave-file GoldenAxeSprites.rom mpr-12383.b7 mpr-12382.b3 $((0x180000)) $((0x40000))

      extract-file      GoldenAxeSound.rom   epr-12390.a10             $((0x0))      $((0x8000))
      extract-file      GoldenAxeSound.rom   mpr-12384.a11             $((0x8000))   $((0x20000))

      dummy-file                             317-0112.c2                             $((0x1000))
      dummy-file                             315-5298.b9                             $((0xEB))
      package-zip                            goldnaxe2.noboot.zip
    ;;

    joust)
      extract-file joust.6800 video_sound_rom_4_std_780.ic12 $((0x0))    $((0x1000))

      extract-file joust.6809 joust_rom_10b_3006-22.a7       $((0x0))    $((0x1000))
      extract-file joust.6809 joust_rom_11b_3006-23.c7       $((0x1000)) $((0x1000))
      extract-file joust.6809 joust_rom_12b_3006-24.e7       $((0x2000)) $((0x1000))
      extract-file joust.6809 joust_rom_1b_3006-13.e4        $((0x3000)) $((0x1000))
      extract-file joust.6809 joust_rom_2b_3006-14.c4        $((0x4000)) $((0x1000))
      extract-file joust.6809 joust_rom_3b_3006-15.a4        $((0x5000)) $((0x1000))
      extract-file joust.6809 joust_rom_4b_3006-16.e5        $((0x6000)) $((0x1000))
      extract-file joust.6809 joust_rom_5b_3006-17.c5        $((0x7000)) $((0x1000))
      extract-file joust.6809 joust_rom_6b_3006-18.a5        $((0x8000)) $((0x1000))
      extract-file joust.6809 joust_rom_7b_3006-19.e6        $((0x9000)) $((0x1000))
      extract-file joust.6809 joust_rom_8b_3006-20.c6        $((0xA000)) $((0x1000))
      extract-file joust.6809 joust_rom_9b_3006-21.a6        $((0xB000)) $((0x1000))

      dummy-file              decoder_rom_4.3g                           $((0x200))
      dummy-file              decoder_rom_6.3c                           $((0x200))
      package-zip             joust.zip
    ;;

    joust2)
      extract-file joust2.1.6809 cpu_2732_ic55_rom2_rev1.4c        $((0x0))     $((0x1000))
      extract-file joust2.1.6809 cpu_2732_ic9_rom3_rev2.4d         $((0x1000))  $((0x1000))
      extract-file joust2.1.6809 cpu_2732_ic10_rom4_rev2.4f        $((0x2000))  $((0x1000))
      extract-file joust2.1.6809 cpu_2732_ic18_rom11_rev1.8j       $((0x3000))  $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic16_rom9_rev2.8h        $((0x5000))  $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic14_rom7_rev2.6j        $((0x7000))  $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic12_rom5_rev2.6h        $((0x9000))  $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic26_rom19_rev1.10j      $((0xB000))  $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic24_rom17_rev1.10h      $((0xD000))  $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic22_rom15_rev1.9j       $((0xF000))  $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic20_rom13_rev1.9h       $((0x11000)) $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic17_rom10_rev1.8i       $((0x13000)) $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic15_rom8_rev1.8g        $((0x15000)) $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic13_rom6_rev2.6i        $((0x17000)) $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic25_rom18_rev1.10i      $((0x19000)) $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic23_rom16_rev1.10g      $((0x1B000)) $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic21_rom14_rev1.9i       $((0x1D000)) $((0x2000))
      extract-file joust2.1.6809 cpu_2732_ic19_rom12_rev1.9g       $((0x1F000)) $((0x2000))

      extract-file joust2.2.6809 snd_27256_rom23_rev1.u4           $((0x0))     $((0x8000))
      extract-file joust2.2.6809 snd_27256_rom24_rev1.u19          $((0x8000))  $((0x8000))
      extract-file joust2.2.6809 snd_27256_rom25_rev1.u20          $((0x10000)) $((0x8000))

      extract-file joust2.6800   cpu_2764_ic8_rom1_rev1.0f         $((0x0))     $((0x2000))

      extract-file joust2.grom   vid_27128_ic57_rom20_rev1.8f      $((0x0))     $((0x4000))
      extract-file joust2.grom   vid_27128_ic58_rom21_rev1.9f      $((0x4000))  $((0x4000))
      extract-file joust2.grom   vid_27128_ic41_rom22_rev1.9d      $((0x8000))  $((0x4000))

      dummy-file                 vid_82s123_ic14_a-5282-10295.2b                $((0x20))
      dummy-file                 vid_82s129_ic47_a-5282-10294.15d               $((0x100))
      dummy-file                 vid_82s147a_ic60_a-5282-10292.12f              $((0x200))
      package-zip                joust2.zip
    ;;

    marblemadness)
      deinterleave-file marblemadness_b.68k  136033.401 136033.402         $((0x0))     $((0x10000))
      deinterleave-file marblemadness_b.68k  136033.403 136033.404         $((0x10000)) $((0x10000))

      deinterleave-file marblemadness.slap   136033.107 136033.108         $((0x0))     $((0x8000))

      extract-file      marblemadness_a.6502 136033.421                    $((0x0))     $((0x4000))
      extract-file      marblemadness_a.6502 136033.422                    $((0x4000))  $((0x4000))

      extract-file      marblemadness_a.prom 136033.118                    $((0x0))     $((0x200))
      extract-file      marblemadness_a.prom 136033.119                    $((0x200))   $((0x200))

      deinterleave-file system1_bios_0.68k   136032.205.l13 136032.206.l12 $((0x0))     $((0x8000))

      # Graphics ROMs unable to be converted to MAME format:
      # marblemadness.1.grom, marblemadness.2.grom, marblemadness.anrom
      dummy-file                             136033.137                                 $((0x04000))
      dummy-file                             136033.138                                 $((0x04000))
      dummy-file                             136033.139                                 $((0x04000))
      dummy-file                             136033.140                                 $((0x04000))
      dummy-file                             136033.141                                 $((0x04000))
      dummy-file                             136033.142                                 $((0x04000))
      dummy-file                             136033.143                                 $((0x04000))
      dummy-file                             136033.144                                 $((0x04000))
      dummy-file                             136033.145                                 $((0x04000))
      dummy-file                             136033.146                                 $((0x04000))
      dummy-file                             136033.149                                 $((0x04000))
      dummy-file                             136033.151                                 $((0x04000))
      dummy-file                             136033.153                                 $((0x04000))

      # Atari System 1 BIOS files not included with Midway Arcade Origins
      dummy-file                             136032.101.e3                              $((0x100))
      dummy-file                             136032.102.e5                              $((0x100))
      dummy-file                             136032.104.f5                              $((0x2000))
      dummy-file                             136032.105.l13                             $((0x4000))
      dummy-file                             136032.106.l12                             $((0x4000))
      dummy-file                             136032.107.b2                              $((0x2000))
      dummy-file                             136032.114.j11                             $((0x4000))
      dummy-file                             136032.115.j10                             $((0x4000))

      package-zip                            marble2.partial.zip
    ;;

    pitfighter)
      deinterleave-file pitfighter.68k    136081-9028.05d 136081-9029.05b   $((0x0))      $((0x20000))
      deinterleave-file pitfighter.68k    136081-9030.15d 136081-9031.15b   $((0x20000))  $((0x20000))

      extract-file      pitfighter.6502   136081-1060.1b                    $((0x0))      $((0x10000))

      extract-file      pitfighter.1.grom 136081-1017.130m                  $((0x0))      $((0x10000))
      extract-file      pitfighter.1.grom 136081-1018.120m                  $((0x10000))  $((0x10000))
      extract-file      pitfighter.1.grom 136081-1021.90m                   $((0x20000))  $((0x10000))
      extract-file      pitfighter.1.grom 136081-1022.75m                   $((0x30000))  $((0x10000))
      extract-file      pitfighter.1.grom 136081-1025.45m                   $((0x40000))  $((0x10000))

      extract-file      pitfighter.2.grom 136081-1027.15l                   $((0x0))      $((0x10000))

      deinterleave-file pitfighter.3.grom 136081-1002.65n  136081-1001.65r  $((0x0))      $((0x40000))
      deinterleave-file pitfighter.3.grom 136081-1004.70n  136081-1003.70r  $((0x40000))  $((0x40000))
      deinterleave-file pitfighter.3.grom 136081-1006.75n  136081-1005.75r  $((0x80000))  $((0x40000))
      deinterleave-file pitfighter.3.grom 136081-1008.90n  136081-1007.90r  $((0xC0000))  $((0x40000))
      deinterleave-file pitfighter.3.grom 136081-1010.100n 136081-1009.100r $((0x100000)) $((0x40000))
      deinterleave-file pitfighter.3.grom 136081-1012.115n 136081-1011.115r $((0x140000)) $((0x40000))
      deinterleave-file pitfighter.3.grom 136081-1014.120n 136081-1013.120r $((0x180000)) $((0x40000))
      deinterleave-file pitfighter.3.grom 136081-1016.130n 136081-1015.130r $((0x1C0000)) $((0x40000))

      extract-file      pitfighter.pcmrom 136081-1061.7k                    $((0x0))      $((0x10000))
      extract-file      pitfighter.pcmrom 136081-1062.7j                    $((0x10000))  $((0x10000))
      extract-file      pitfighter.pcmrom 136081-1063.7e                    $((0x20000))  $((0x10000))
      extract-file      pitfighter.pcmrom 136081-1064.7d                    $((0x30000))  $((0x10000))

      dummy-file                          136081-1040.30s                                 $((0x200))
      dummy-file                          136081-1041.25s                                 $((0x200))
      dummy-file                          136081-1042.20s                                 $((0x200))
      dummy-file                          gal16v8a-136081-1043.15e                        $((0x117))
      dummy-file                          gal16v8a-136079-1045.40p                        $((0x117))
      dummy-file                          gal16v8a-136079-1046.65d                        $((0x117))
      dummy-file                          gal16v8a-136079-1047.40s                        $((0x117))
      dummy-file                          gal16v8a-136079-1048.125f                       $((0x117))
      dummy-file                          gal16v8a-136079-1049.120f                       $((0x117))
      dummy-file                          gal16v8a-136079-1050.115f                       $((0x117))
      dummy-file                          gal16v8a-136079-1051.105f                       $((0x117))
      dummy-file                          gal16v8a-136079-1052.30n                        $((0x117))
      package-zip                         pitfight.zip
    ;;

    rampage)
      extract-file      rampage.z80    pro-0_3b_rev_3_8-27-86.3b                   $((0x0))     $((0x8000))
      extract-file      rampage.z80    pro-1_5b_rev_3_8-27-86.5b                   $((0x8000))  $((0x8000))

      deinterleave-file rampage.68k    u-7_rev.2_8-14-86.u7 u-17_rev.2_8-14-86.u17 $((0x0))     $((0x10000))
      deinterleave-file rampage.68k    u-8_rev.2_8-14-86.u8 u-18_rev.2_8-14-86.u18 $((0x10000)) $((0x10000))

      extract-file      rampage.1.grom bg-0_u15_7-23-86.15a                        $((0x0))    $((0x4000))
      extract-file      rampage.1.grom bg-1_u14_7-23-86.14b                        $((0x4000)) $((0x4000))

      extract-file      rampage.2.grom fg-0_8e_6-30-86.8e                          $((0x0))     $((0x10000))
      extract-file      rampage.2.grom fg-1_6e_6-30-86.6e                          $((0x10000)) $((0x10000))
      extract-file      rampage.2.grom fg-2_5e_6-30-86.5e                          $((0x20000)) $((0x10000))
      extract-file      rampage.2.grom fg-3_4e_6-30-86.4e                          $((0x30000)) $((0x10000))

      package-zip                      rampage.zip
    ;;

    rampart)
      deinterleave-file rampart_a.68k  136082-1033.13l 136082-1032.13j $((0x0))     $((0x100000))
      deinterleave-file rampart_a.68k  136082-2031.13l 136082-2030.13h $((0x0))     $((0x20000))

      extract-file      rampart.1.grom 136082-1009.2n                  $((0x0))     $((0x20000))

      extract-file      rampart.pcmrom 136082-1007.2d                  $((0x0))     $((0x20000))
      extract-file      rampart.pcmrom 136082-1008.1d                  $((0x20000)) $((0x20000))

      extract-file      rampart.pals   gal16v8-136082-1000.1j          $((0x0))     $((0x117))
      extract-file      rampart.pals   gal16v8-136082-1001.4l          $((0x117))   $((0x117))
      extract-file      rampart.pals   gal16v8-136082-1002.7k          $((0x22E))   $((0x117))
      extract-file      rampart.pals   gal20v8-136082-1003.8j          $((0x345))   $((0x157))
      extract-file      rampart.pals   gal20v8-136082-1004.8m          $((0x49C))   $((0x157))
      extract-file      rampart.pals   gal16v8-136082-1006.12c         $((0x5F3))   $((0x117))

      dummy-file                       rampart-eeprom.bin                           $((0x800))
      package-zip                      rampart.zip
    ;;

    robotron)
      extract-file robotron.6800 video_sound_rom_3_std_767.ic12 $((0x0))    $((0x1000))

      extract-file robotron.6809 2084_rom_10b_3005-22.a7        $((0x0))    $((0x1000))
      extract-file robotron.6809 2084_rom_11b_3005-23.c7        $((0x1000)) $((0x1000))
      extract-file robotron.6809 2084_rom_12b_3005-24.e7        $((0x2000)) $((0x1000))
      extract-file robotron.6809 2084_rom_1b_3005-13.e4         $((0x3000)) $((0x1000))
      extract-file robotron.6809 2084_rom_2b_3005-14.c4         $((0x4000)) $((0x1000))
      extract-file robotron.6809 2084_rom_3b_3005-15.a4         $((0x5000)) $((0x1000))
      extract-file robotron.6809 2084_rom_4b_3005-16.e5         $((0x6000)) $((0x1000))
      extract-file robotron.6809 2084_rom_5b_3005-17.c5         $((0x7000)) $((0x1000))
      extract-file robotron.6809 2084_rom_6b_3005-18.a5         $((0x8000)) $((0x1000))
      extract-file robotron.6809 2084_rom_7b_3005-19.e6         $((0x9000)) $((0x1000))
      extract-file robotron.6809 2084_rom_8b_3005-20.c6         $((0xA000)) $((0x1000))
      extract-file robotron.6809 2084_rom_9b_3005-21.a6         $((0xB000)) $((0x1000))

      dummy-file                 decoder_rom_4.3g                           $((0x200))
      dummy-file                 decoder_rom_6.3c                           $((0x200))
      package-zip                robotron.zip
    ;;

    satanshollow)
      extract-file satanshollow.1.z80  sh-pro.00   $((0x0))    $((0x2000))
      extract-file satanshollow.1.z80  sh-pro.01   $((0x2000)) $((0x2000))
      extract-file satanshollow.1.z80  sh-pro.02   $((0x4000)) $((0x2000))
      extract-file satanshollow.1.z80  sh-pro.03   $((0x6000)) $((0x2000))
      extract-file satanshollow.1.z80  sh-pro.04   $((0x8000)) $((0x2000))
      extract-file satanshollow.1.z80  sh-pro.05   $((0xA000)) $((0x2000))

      extract-file satanshollow.2.z80  sh-snd.01   $((0x0))    $((0x1000))
      extract-file satanshollow.2.z80  sh-snd.02   $((0x1000)) $((0x1000))
      extract-file satanshollow.2.z80  sh-snd.03   $((0x2000)) $((0x1000))

      extract-file satanshollow.1.grom sh-bg.00    $((0x0))    $((0x2000))
      extract-file satanshollow.1.grom sh-bg.01    $((0x2000)) $((0x2000))

      extract-file satanshollow.2.grom sh-fg.00    $((0x0))    $((0x2000))
      extract-file satanshollow.2.grom sh-fg.01    $((0x2000)) $((0x2000))
      extract-file satanshollow.2.grom sh-fg.02    $((0x4000)) $((0x2000))
      extract-file satanshollow.2.grom sh-fg.03    $((0x6000)) $((0x2000))

      dummy-file                       82s123.12d              $((0x20))
      package-zip                      shollow.zip
    ;;

    SHINOARC)
      # These files match the shinobi6 set
      deinterleave-file SHINOARC_V.68K         epr-11360.a7 epr-11359.a5 $((0x0))     $((0x40000))

      # These files match the shinobi5 set
      extract-file      SHINOARC_V_TILES.ROM   opr-11284.b9              $((0x0))     $((0x10000))
      extract-file      SHINOARC_V_TILES.ROM   opr-11285.b10             $((0x10000)) $((0x10000))
      extract-file      SHINOARC_V_TILES.ROM   opr-11286.b11             $((0x20000)) $((0x10000))

      # These files match the shinobi5 set
      deinterleave-file SHINOARC_V_SPRITES.ROM opr-11294.b5 opr-11290.b1 $((0x0))     $((0x20000))
      deinterleave-file SHINOARC_V_SPRITES.ROM opr-11295.b6 opr-11291.b2 $((0x20000)) $((0x20000))
      deinterleave-file SHINOARC_V_SPRITES.ROM opr-11296.b7 opr-11292.b3 $((0x40000)) $((0x20000))
      deinterleave-file SHINOARC_V_SPRITES.ROM opr-11297.b8 opr-11293.b4 $((0x60000)) $((0x20000))

      # epr-11361.a10 matches the shinobi6 set
      # epr-11288.a8 and epr-11289.a9 match the shinobi5 set
      extract-file      SHINOARC_V_SOUND.ROM   epr-11361.a10            $((0x0))     $((0x8000))
      extract-file      SHINOARC_V_SOUND.ROM   epr-11288.a8             $((0x8000))  $((0x8000))
      extract-file      SHINOARC_V_SOUND.ROM   epr-11289.a9             $((0x10000)) $((0x8000))

      package-zip                              shinobi5+shinobi6.partial.zip
    ;;

    sinistar)
      extract-file sinistar.6800 3004_speech_ic7_r1_16-3004-52.ic7 $((0x0))    $((0x1000))
      extract-file sinistar.6800 3004_speech_ic5_r1_16-3004-50.ic5 $((0x1000)) $((0x1000))
      extract-file sinistar.6800 3004_speech_ic6_r1_16-3004-51.ic6 $((0x2000)) $((0x1000))
      extract-file sinistar.6800 3004_speech_ic4_r1_16-3004-49.ic4 $((0x3000)) $((0x1000))
      extract-file sinistar.6800 video_sound_rom_9_std.808.ic12    $((0x4000)) $((0x1000))

      extract-file sinistar.6809 sinistar_rom_10-b_16-3004-62.4c   $((0x0))    $((0x1000))
      extract-file sinistar.6809 sinistar_rom_11-b_16-3004-63.4a   $((0x1000)) $((0x1000))
      extract-file sinistar.6809 sinistar_rom_1-b_16-3004-53.1d    $((0x2000)) $((0x1000))
      extract-file sinistar.6809 sinistar_rom_2-b_16-3004-54.1c    $((0x3000)) $((0x1000))
      extract-file sinistar.6809 sinistar_rom_3-b_16-3004-55.1a    $((0x4000)) $((0x1000))
      extract-file sinistar.6809 sinistar_rom_4-b_16-3004-56.2d    $((0x5000)) $((0x1000))
      extract-file sinistar.6809 sinistar_rom_5-b_16-3004-57.2c    $((0x6000)) $((0x1000))
      extract-file sinistar.6809 sinistar_rom_6-b_16-3004-58.2a    $((0x7000)) $((0x1000))
      extract-file sinistar.6809 sinistar_rom_7-b_16-3004-59.3d    $((0x8000)) $((0x1000))
      extract-file sinistar.6809 sinistar_rom_8-b_16-3004-60.3c    $((0x9000)) $((0x1000))
      extract-file sinistar.6809 sinistar_rom_9-b_16-3004-61.3a    $((0xA000)) $((0x1000))

      dummy-file                 decoder_rom_4.3g                              $((0x200))
      dummy-file                 decoder_rom_6.3c                              $((0x200))
      package-zip                sinistar.zip
    ;;

    smashtv)
      deinterleave-file smashtv.34010 la8_smash_tv_game_rom_u105.u105 la8_smash_tv_game_rom_u89.u89 $((0x0))      $((0x40000))

      extract-file      smashtv.6809  sl2_smash_tv_sound_rom_u4.u4                                  $((0x0))      $((0x10000))
      extract-file      smashtv.6809  sl2_smash_tv_sound_rom_u19.u19                                $((0x10000))  $((0x10000))
      extract-file      smashtv.6809  sl2_smash_tv_sound_rom_u20.u20                                $((0x20000))  $((0x10000))

      extract-file      smashtv.grom  la1_smash_tv_game_rom_u111.u111                               $((0x0))      $((0x20000))
      extract-file      smashtv.grom  la1_smash_tv_game_rom_u112.u112                               $((0x20000))  $((0x20000))
      extract-file      smashtv.grom  la1_smash_tv_game_rom_u113.u113                               $((0x40000))  $((0x20000))
      extract-file      smashtv.grom  la1_smash_tv_game_rom_u95.u95                                 $((0x60000))  $((0x20000))
      extract-file      smashtv.grom  la1_smash_tv_game_rom_u96.u96                                 $((0x80000))  $((0x20000))
      extract-file      smashtv.grom  la1_smash_tv_game_rom_u97.u97                                 $((0xA0000))  $((0x20000))
      extract-file      smashtv.grom  la1_smash_tv_game_rom_u106.u106                               $((0xC0000))  $((0x20000))
      extract-file      smashtv.grom  la1_smash_tv_game_rom_u107.u107                               $((0xE0000))  $((0x20000))
      extract-file      smashtv.grom  la1_smash_tv_game_rom_u108.u108                               $((0x100000)) $((0x20000))

      package-zip                     smashtv.zip
    ;;

    spyhunter)
      extract-file      spyhunter.1.grom spy-hunter_cpu_bg0_11-18-83.3a                                                $((0x0))     $((0x2000))
      extract-file      spyhunter.1.grom spy-hunter_cpu_bg1_11-18-83.4a                                                $((0x2000))  $((0x2000))
      extract-file      spyhunter.1.grom spy-hunter_cpu_bg2_11-18-83.5a                                                $((0x4000))  $((0x2000))
      extract-file      spyhunter.1.grom spy-hunter_cpu_bg3_11-18-83.6a                                                $((0x6000))  $((0x2000))

      extract-file      spyhunter.2.grom spy-hunter_video_1fg_11-18-83.a7                                              $((0x0))     $((0x4000))
      extract-file      spyhunter.2.grom spy-hunter_video_0fg_11-18-83.a8                                              $((0x4000))  $((0x4000))
      extract-file      spyhunter.2.grom spy-hunter_video_3fg_11-18-83.a5                                              $((0x8000))  $((0x4000))
      extract-file      spyhunter.2.grom spy-hunter_video_2fg_11-18-83.a6                                              $((0xC000))  $((0x4000))
      extract-file      spyhunter.2.grom spy-hunter_video_5fg_11-18-83.a3                                              $((0x10000)) $((0x4000))
      extract-file      spyhunter.2.grom spy-hunter_video_4fg_11-18-83.a4                                              $((0x14000)) $((0x4000))
      extract-file      spyhunter.2.grom spy-hunter_video_7fg_11-18-83.a1                                              $((0x18000)) $((0x4000))
      extract-file      spyhunter.2.grom spy-hunter_video_6fg_11-18-83.a2                                              $((0x1C000)) $((0x4000))

      extract-file      spyhunter.3.grom spy-hunter_cpu_alpha-n_11-18-83                                               $((0x0))     $((0x1000))

      extract-file      spyhunter.1.z80  spy-hunter_cpu_pg0_2-9-84.6d                                                  $((0x0))     $((0x2000))
      extract-file      spyhunter.1.z80  spy-hunter_cpu_pg1_2-9-84.7d                                                  $((0x2000))  $((0x2000))
      extract-file      spyhunter.1.z80  spy-hunter_cpu_pg2_2-9-84.8d                                                  $((0x4000))  $((0x2000))
      extract-file      spyhunter.1.z80  spy-hunter_cpu_pg3_2-9-84.9d                                                  $((0x6000))  $((0x2000))
      extract-file      spyhunter.1.z80  spy-hunter_cpu_pg4_2-9-84.10d                                                 $((0x8000))  $((0x2000))
      extract-file      spyhunter.1.z80  spy-hunter_cpu_pg5_2-9-84.11d                                                 $((0xC000))  $((0x2000))
      extract-file      spyhunter.1.z80  spy-hunter_cpu_pg5_2-9-84.11d                                                 $((0xA000))  $((0x2000))

      extract-file      spyhunter.2.z80  spy-hunter_snd_0_sd_11-18-83.a7                                               $((0x0))     $((0x1000))
      extract-file      spyhunter.2.z80  spy-hunter_snd_1_sd_11-18-83.a8                                               $((0x1000))  $((0x1000))

      deinterleave-file spyhunter.68k    spy-hunter_cs_deluxe_u7_a_11-18-83.u7 spy-hunter_cs_deluxe_u17_b_11-18-83.u17 $((0x0))     $((0x4000))
      deinterleave-file spyhunter.68k    spy-hunter_cs_deluxe_u8_c_11-18-83.u8 spy-hunter_cs_deluxe_u18_d_11-18-83.u18 $((0x4000))  $((0x4000))

      dummy-file                         82s123.12d                                                                                 $((0x20))
      dummy-file                         0304-00803-0052.u15                                                                        $((0x4A))
      package-zip                        spyhunt.zip
    ;;

    spyhunter2)
      deinterleave-file spyhunter2.1.68k  sh2_3c_rev2.3c sh2_3b_rev2.3b                       $((0x0))     $((0x20000))
      deinterleave-file spyhunter2.1.68k  sh2_2c_rev2.2c sh2_2b_rev2.2b                       $((0x20000)) $((0x20000))

      deinterleave-file spyhunter2.2.68k  spyhunter_ii_u7_sound.u7 spyhunter_ii_u17_sound.u17 $((0x0))     $((0x20000))

      extract-file      spyhunter2.6809   spyhunter_ii_u5.u5                                  $((0x0))     $((0x4000))
      extract-file      spyhunter2.6809   spyhunter_ii_u4.u4                                  $((0x4000))  $((0x4000))

      extract-file      spyhunter2.1.grom sh2_bg0_rev2.11d                                    $((0x0))     $((0x8000))
      extract-file      spyhunter2.1.grom sh2_bg1_rev2.12d                                    $((0x8000))  $((0x8000))

      extract-file      spyhunter2.2.grom fg0.7j                                              $((0x0))     $((0x20000))
      extract-file      spyhunter2.2.grom fg1.8j                                              $((0x20000)) $((0x20000))
      extract-file      spyhunter2.2.grom fg2.9j                                              $((0x40000)) $((0x20000))
      extract-file      spyhunter2.2.grom fg3.10j                                             $((0x60000)) $((0x20000))

      package-zip                         spyhunt2.zip
    ;;

    stargate*)
      [[ $1 == *defender2 ]] && ROM_SUFFIX=_p

      extract-file stargate.6800              video_sound_rom_2_std_744.ic12 $((0x0))    $((0x800))

      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_10-a_3002-10.a7   $((0x0))    $((0x1000))
      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_11-a_3002-11.c7   $((0x1000)) $((0x1000))
      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_12-a_3002-12.e7   $((0x2000)) $((0x1000))
      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_1-a_3002-1.e4     $((0x3000)) $((0x1000))
      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_2-a_3002-2.c4     $((0x4000)) $((0x1000))
      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_3-a_3002-3.a4     $((0x5000)) $((0x1000))
      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_4-a_3002-4.e5     $((0x6000)) $((0x1000))
      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_5-a_3002-5.c5     $((0x7000)) $((0x1000))
      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_6-a_3002-6.a5     $((0x8000)) $((0x1000))
      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_7-a_3002-7.e6     $((0x9000)) $((0x1000))
      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_8-a_3002-8.c6     $((0xA000)) $((0x1000))
      extract-file stargate${ROM_SUFFIX}.6809 stargate_rom_9-a_3002-9.a6     $((0xB000)) $((0x1000))

      dummy-file                              decoder_rom_4.3g                           $((0x200))
      dummy-file                              decoder_rom_5.3c                           $((0x200))
      package-zip                             $1.zip
    ;;

    superoffroad)
      extract-file      superoffroad.1.z80  03-22121-04.u58t                  $((0x0))     $((0x10000))
      extract-file      superoffroad.1.z80  03-22122-03.u59t                  $((0x10000)) $((0x10000))
      extract-file      superoffroad.1.z80  03-22120-01.u57t                  $((0x20000)) $((0x10000))
      extract-file      superoffroad.1.z80  03-22119-02.u56t                  $((0x30000)) $((0x10000))

      extract-file      superoffroad.2.z80  03-22100-02.u3                    $((0x0))     $((0x2000))
      extract-file      superoffroad.2.z80  03-22108-02.u4t                   $((0x2000))  $((0x10000))
      extract-file      superoffroad.2.z80  03-22109-02.u5t                   $((0x12000)) $((0x10000))
      extract-file      superoffroad.2.z80  03-22110-02.u6t                   $((0x22000)) $((0x10000))
      extract-file      superoffroad.2.z80  03-22111-01.u7t                   $((0x32000)) $((0x10000))
      extract-file      superoffroad.2.z80  03-22112-01.u8t                   $((0x42000)) $((0x10000))

      deinterleave-file superoffroad.186    03-22113-03.u13t 03-22116-03.u25t $((0x0))     $((0x20000))
      deinterleave-file superoffroad.186    03-22114-03.u14t 03-22117-03.u26t $((0x20000)) $((0x20000))
      deinterleave-file superoffroad.186    03-22115-03.u15t 03-22118-03.u27t $((0x40000)) $((0x20000))

      extract-file      superoffroad.1.grom 03-22105-02.u93                   $((0x0))     $((0x8000))
      extract-file      superoffroad.1.grom 03-22106-02.u94                   $((0x8000))  $((0x8000))
      extract-file      superoffroad.1.grom 03-22107-02.u95                   $((0x10000)) $((0x8000))

      extract-file      superoffroad.user   03-22104-01.u92                   $((0x0))     $((0x4000))
      extract-file      superoffroad.user   03-22102-01.u69                   $((0x4000))  $((0x4000))
      extract-file      superoffroad.user   03-22103-02.u90                   $((0x8000))  $((0x4000))
      extract-file      superoffroad.user   03-22101-02.u67                   $((0xC000))  $((0x4000))

      extract-file      superoffroad.eeprom eeprom-offroad.bin                $((0x0))     $((0x80))

      package-zip                           offroad.zip
    ;;

    supersprint)
      deinterleave-file supersprint_a.t11  136042-330.7l 136042-331.7n $((0x0))     $((0x8000))
      deinterleave-file supersprint_a.t11  136042-329.6f 136042-325.6n $((0x8000))  $((0x10000))
      deinterleave-file supersprint_a.t11  136042-127.6k 136042-123.6r $((0x18000)) $((0x10000))
      deinterleave-file supersprint_a.t11  136042-126.6l 136042-122.6s $((0x28000)) $((0x10000))

      extract-file      supersprint_a.6502 136042-419.2bc              $((0x0))     $((0x4000))
      extract-file      supersprint_a.6502 136042-420.2d               $((0x4000))  $((0x4000))

      extract-file      supersprint.pfrom  136042-105.6a               $((0x20000)) $((0x8000))
      extract-file      supersprint.pfrom  136042-105.6a               $((0x0))     $((0x8000))
      extract-file      supersprint.pfrom  136042-106.6b               $((0x8000))  $((0x8000))
      extract-file      supersprint.pfrom  136042-101.7a               $((0x30000)) $((0x8000))
      extract-file      supersprint.pfrom  136042-101.7a               $((0x10000)) $((0x8000))
      extract-file      supersprint.pfrom  136042-102.7b               $((0x18000)) $((0x8000))
      extract-file      supersprint.pfrom  136042-107.6c               $((0x60000)) $((0x8000))
      extract-file      supersprint.pfrom  136042-107.6c               $((0x40000)) $((0x8000))
      extract-file      supersprint.pfrom  136042-108.6de              $((0x48000)) $((0x8000))
      extract-file      supersprint.pfrom  136042-104.7de              $((0x70000)) $((0x8000))
      extract-file      supersprint.pfrom  136042-104.7de              $((0x50000)) $((0x8000))
      extract-file      supersprint.pfrom  136042-103.7c               $((0x58000)) $((0x8000))

      extract-file      supersprint.mobrom 136042-113.6l               $((0x0))     $((0x8000))
      extract-file      supersprint.mobrom 136042-112.6k               $((0x8000))  $((0x8000))
      extract-file      supersprint.mobrom 136042-110.6jh              $((0x10000)) $((0x8000))
      extract-file      supersprint.mobrom 136042-109.6fh              $((0x18000)) $((0x8000))
      extract-file      supersprint.mobrom 136042-117.6rs              $((0x20000)) $((0x8000))
      extract-file      supersprint.mobrom 136042-116.6pr              $((0x28000)) $((0x8000))
      extract-file      supersprint.mobrom 136042-115.6n               $((0x30000)) $((0x8000))
      extract-file      supersprint.mobrom 136042-114.6m               $((0x38000)) $((0x8000))


      extract-file      supersprint.anrom  136042-118.6t               $((0x0))     $((0x4000))

      dummy-file                           ssprint-eeprom.bin                       $((0x200))
      package-zip                          ssprint.zip
    ;;

    tapper)
      extract-file tapper_r.1.grom rbtbg1.bin   $((0x0))     $((0x4000))
      extract-file tapper_r.1.grom rbtbg0.bin   $((0x4000))  $((0x4000))

      extract-file tapper_r.2.grom rbtfg1.bin   $((0x0))     $((0x4000))
      extract-file tapper_r.2.grom rbtfg0.bin   $((0x4000))  $((0x4000))
      extract-file tapper_r.2.grom rbtfg3.bin   $((0x8000))  $((0x4000))
      extract-file tapper_r.2.grom rbtfg2.bin   $((0xC000))  $((0x4000))
      extract-file tapper_r.2.grom rbtfg5.bin   $((0x10000)) $((0x4000))
      extract-file tapper_r.2.grom rbtfg4.bin   $((0x14000)) $((0x4000))
      extract-file tapper_r.2.grom rbtfg7.bin   $((0x18000)) $((0x4000))
      extract-file tapper_r.2.grom rbtfg6.bin   $((0x1C000)) $((0x4000))

      extract-file tapper_r.1.z80  rbtpg0.bin   $((0x0))     $((0x4000))
      extract-file tapper_r.1.z80  rbtpg1.bin   $((0x4000))  $((0x4000))
      extract-file tapper_r.1.z80  rbtpg2.bin   $((0x8000))  $((0x4000))
      extract-file tapper_r.1.z80  rbtpg3.bin   $((0xC000))  $((0x2000))

      extract-file tapper_r.2.z80  5788         $((0x0))     $((0x1000))
      extract-file tapper_r.2.z80  5787         $((0x1000))  $((0x1000))
      extract-file tapper_r.2.z80  5786         $((0x2000))  $((0x1000))
      extract-file tapper_r.2.z80  5785         $((0x3000))  $((0x1000))

      dummy-file                   82s123.12d              $((0x20))
      package-zip                  rbtapper.zip
    ;;

    toobin)
      deinterleave-file toobin_a.68k  3133-1j.061 3137-1f.061 $((0x0))      $((0x20000))
      deinterleave-file toobin_a.68k  3134-2j.061 3138-2f.061 $((0x20000))  $((0x20000))
      deinterleave-file toobin_a.68k  3135-4j.061 3139-4f.061 $((0x40000))  $((0x20000))
      deinterleave-file toobin_a.68k  1136-5j.061 1140-5f.061 $((0x60000))  $((0x20000))

      extract-file      toobin.6502   1141-2k.061             $((0x0))      $((0x10000))

      extract-file      toobin.1.grom 1101-1a.061             $((0x0))      $((0x10000))
      extract-file      toobin.1.grom 1102-2a.061             $((0x10000))  $((0x10000))
      extract-file      toobin.1.grom 1103-4a.061             $((0x20000))  $((0x10000))
      extract-file      toobin.1.grom 1104-5a.061             $((0x30000))  $((0x10000))
      extract-file      toobin.1.grom 1105-1b.061             $((0x40000))  $((0x10000))
      extract-file      toobin.1.grom 1106-2b.061             $((0x50000))  $((0x10000))
      extract-file      toobin.1.grom 1107-4b.061             $((0x60000))  $((0x10000))
      extract-file      toobin.1.grom 1108-5b.061             $((0x70000))  $((0x10000))

      extract-file      toobin.2.grom 1143-10a.061            $((0x0))      $((0x20000))
      extract-file      toobin.2.grom 1144-13a.061            $((0x20000))  $((0x20000))
      extract-file      toobin.2.grom 1145-16a.061            $((0x40000))  $((0x20000))
      extract-file      toobin.2.grom 1146-18a.061            $((0x60000))  $((0x20000))
      extract-file      toobin.2.grom 1125-21a.061            $((0x80000))  $((0x10000))
      extract-file      toobin.2.grom 1126-23a.061            $((0x90000))  $((0x10000))
      extract-file      toobin.2.grom 1127-24a.061            $((0xA0000))  $((0x10000))
      extract-file      toobin.2.grom 1128-25a.061            $((0xB0000))  $((0x10000))
      extract-file      toobin.2.grom 1147-10b.061            $((0xC0000))  $((0x20000))
      extract-file      toobin.2.grom 1148-13b.061            $((0xE0000))  $((0x20000))
      extract-file      toobin.2.grom 1149-16b.061            $((0x100000)) $((0x20000))
      extract-file      toobin.2.grom 1150-18b.061            $((0x120000)) $((0x20000))
      extract-file      toobin.2.grom 1129-21b.061            $((0x140000)) $((0x10000))
      extract-file      toobin.2.grom 1130-23b.061            $((0x150000)) $((0x10000))
      extract-file      toobin.2.grom 1131-24b.061            $((0x160000)) $((0x10000))
      extract-file      toobin.2.grom 1132-25b.061            $((0x170000)) $((0x10000))

      extract-file      toobin.3.grom 1142-20h.061            $((0x0))      $((0x4000))

      package-zip       toobin.zip
    ;;

    totalcarnage)
      deinterleave-file totalcarnage.34010  la1_total_carnage_game_rom_u105.u105 la1_total_carnage_game_rom_u89.u89 $((0x0))      $((0x80000))

      extract-file      totalcarnage.6809   sl1_total_carnage_sound_rom_u3.u3                                       $((0x0))      $((0x20000))

      extract-file      totalcarnage.pcmrom sl1_total_carnage_sound_rom_u12.u12                                     $((0x0))      $((0x40000))
      extract-file      totalcarnage.pcmrom sl1_total_carnage_sound_rom_u13.u13                                     $((0x40000))  $((0x40000))

      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u111.u111                                    $((0x0))      $((0x40000))
      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u112.u112                                    $((0x40000))  $((0x40000))
      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u113.u113                                    $((0x80000))  $((0x40000))
      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u114.u114                                    $((0xC0000))  $((0x40000))
      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u95.u95                                      $((0x100000)) $((0x40000))
      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u96.u96                                      $((0x140000)) $((0x40000))
      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u97.u97                                      $((0x180000)) $((0x40000))
      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u98.u98                                      $((0x1C0000)) $((0x40000))
      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u106.u106                                    $((0x200000)) $((0x40000))
      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u107.u107                                    $((0x240000)) $((0x40000))
      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u108.u108                                    $((0x280000)) $((0x40000))
      extract-file      totalcarnage.grom   la1_total_carnage_game_rom_u109.u109                                    $((0x2C0000)) $((0x40000))

      package-zip                           totcarn.zip
    ;;

    tournamentcyberball2072)
      deinterleave-file tournamentcyberball2072.1.68k  136073-2007.1m 136073-2008.1kl $((0x0))      $((0x20000))
      deinterleave-file tournamentcyberball2072.1.68k  136073-2009.3m 136073-2010.3kl $((0x20000))  $((0x20000))

      deinterleave-file tournamentcyberball2072.2.68k  136073-2011.3cd 136073-2012.1b $((0x0))      $((0x20000))
      deinterleave-file tournamentcyberball2072.2.68k  136073-1013.1cd 136073-1014.3b $((0x20000))  $((0x20000))

      deinterleave-file tournamentcyberball2072.3.68k  136064-1132.3cd 136064-1133.1b $((0x0))      $((0x20000))
      deinterleave-file tournamentcyberball2072.3.68k  136064-1134.1cd 136064-1135.3b $((0x20000))  $((0x20000))

      extract-file      tournamentcyberball2072.6502   136073-1029.2f                 $((0x0))      $((0x10000))

      extract-file      tournamentcyberball2072.1.grom 136071-1001.55l                $((0x0))      $((0x20000))
      extract-file      tournamentcyberball2072.1.grom 136071-1005.43l                $((0x20000))  $((0x20000))
      extract-file      tournamentcyberball2072.1.grom 136071-1032.18a                $((0x40000))  $((0x10000))
      extract-file      tournamentcyberball2072.1.grom 136071-1002.55n                $((0x170000)) $((0x20000))
      extract-file      tournamentcyberball2072.1.grom 136071-1006.43n                $((0x190000)) $((0x20000))
      extract-file      tournamentcyberball2072.1.grom 136071-1033.13a                $((0x210000)) $((0x10000))
      extract-file      tournamentcyberball2072.1.grom 136071-1003.90l                $((0x2E0000)) $((0x20000))
      extract-file      tournamentcyberball2072.1.grom 136071-1007.78l                $((0x300000)) $((0x20000))
      extract-file      tournamentcyberball2072.1.grom 136071-1034.18c                $((0x320000)) $((0x10000))
      extract-file      tournamentcyberball2072.1.grom 136071-1004.90n                $((0x450000)) $((0x20000))
      extract-file      tournamentcyberball2072.1.grom 136071-1008.78n                $((0x470000)) $((0x20000))
      extract-file      tournamentcyberball2072.1.grom 136071-1035.13c                $((0x490000)) $((0x10000))

      extract-file      tournamentcyberball2072.2.grom 136073-1001.9lm                $((0x0))      $((0x10000))
      extract-file      tournamentcyberball2072.2.grom 136073-1002.8lm                $((0x10000))  $((0x10000))
      extract-file      tournamentcyberball2072.2.grom 136073-1003.11lm               $((0x20000))  $((0x10000))
      extract-file      tournamentcyberball2072.2.grom 136073-1004.10lm               $((0x30000))  $((0x10000))

      extract-file      tournamentcyberball2072.3.grom 136073-1005.15n                $((0x0))      $((0x10000))
      extract-file      tournamentcyberball2072.3.grom 136073-1006.16n                $((0x10000))  $((0x10000))

      dummy-file                                       cyberbalt-eeprom.bin                         $((0x800))
      package-zip                                      cyberbalt.zip
    ;;

    vindicators2)
      deinterleave-file vindicators2_a.68k    136059-1186.9a 136059-1187.9b   $((0x8000))  $((0x8000))
      deinterleave-file vindicators2_a.68k    136059-1186.9a 136059-1187.9b   $((0x0))     $((0x8000))

      deinterleave-file vindicators2_a.2.68k  136059-1196.10a 136059-1197.10b $((0x0))     $((0x8000))
      deinterleave-file vindicators2_a.2.68k  136059-3188.7a 136059-3189.7b   $((0x10000)) $((0x8000))
      deinterleave-file vindicators2_a.2.68k  136059-3188.7a 136059-3189.7b   $((0x8000))  $((0x8000))
      deinterleave-file vindicators2_a.2.68k  136059-2190.6a 136059-2191.6b   $((0x20000)) $((0x8000))
      deinterleave-file vindicators2_a.2.68k  136059-2190.6a 136059-2191.6b   $((0x18000)) $((0x8000))
      deinterleave-file vindicators2_a.2.68k  136059-2192.5a 136059-2193.5b   $((0x30000)) $((0x8000))
      deinterleave-file vindicators2_a.2.68k  136059-2192.5a 136059-2193.5b   $((0x28000)) $((0x8000))
      deinterleave-file vindicators2_a.2.68k  136059-1194.3a 136059-1195.3b   $((0x40000)) $((0x8000))
      deinterleave-file vindicators2_a.2.68k  136059-1194.3a 136059-1195.3b   $((0x38000)) $((0x8000))

      extract-file      vindicators2.6502     136059-1160.16s                 $((0x0))     $((0x4000))
      extract-file      vindicators2.6502     136059-1161.16r                 $((0x4000))  $((0x8000))

      extract-file      vindicators2.1.grom   136059-1198.6p                  $((0x0))     $((0x4000))

      extract-file      vindicators2.2.grom   136059-1162.1a                  $((0x0))     $((0x8000))
      extract-file      vindicators2.2.grom   136059-1166.1b                  $((0x8000))  $((0x8000))
      extract-file      vindicators2.2.grom   136059-1170.1c                  $((0x10000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1174.1d                  $((0x18000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1178.1ef                 $((0x20000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1182.1j                  $((0x28000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1163.1l                  $((0x30000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1167.1mn                 $((0x38000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1171.1p                  $((0x40000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1175.1r                  $((0x48000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1179.1st                 $((0x50000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1183.1u                  $((0x58000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1164.2a                  $((0x60000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1168.2b                  $((0x68000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1172.2c                  $((0x70000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1176.2d                  $((0x78000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1180.2ef                 $((0x80000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1184.2j                  $((0x88000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1165.2l                  $((0x90000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1169.2mn                 $((0x98000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1173.2p                  $((0xA0000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1177.2r                  $((0xA8000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1181.2st                 $((0xB0000)) $((0x8000))
      extract-file      vindicators2.2.grom   136059-1185.2u                  $((0xB8000)) $((0x8000))

      dummy-file                              74s472-136037-101.7u                         $((0x200))
      dummy-file                              74s472-136037-102.5l                         $((0x200))
      dummy-file                              74s287-136037-103.4r                         $((0x100))
      package-zip                             vindctr2.zip
    ;;

    wizardofwor)
      extract-file wizardofwor.z80 wow.x1  $((0x0))    $((0x1000))
      extract-file wizardofwor.z80 wow.x2  $((0x1000)) $((0x1000))
      extract-file wizardofwor.z80 wow.x3  $((0x2000)) $((0x1000))
      extract-file wizardofwor.z80 wow.x4  $((0x3000)) $((0x1000))
      extract-file wizardofwor.z80 wow.x5  $((0x4000)) $((0x1000))
      extract-file wizardofwor.z80 wow.x6  $((0x5000)) $((0x1000))
      extract-file wizardofwor.z80 wow.x7  $((0x6000)) $((0x1000))

      package-zip                  wow.zip
    ;;

    xenophobe)
      deinterleave-file xenophobe.1.68k  xeno_pro.3c xeno_pro.3b  $((0x0))     $((0x20000))
      deinterleave-file xenophobe.1.68k  xeno_pro.2c xeno_pro.2b  $((0x20000)) $((0x20000))

      deinterleave-file xenophobe.2.68k  xeno_snd.u7 xeno_snd.u17 $((0x0))     $((0x20000))
      deinterleave-file xenophobe.2.68k  xeno_snd.u8 xeno_snd.u18 $((0x20000)) $((0x20000))

      extract-file      xenophobe.1.grom xeno_bg.11d              $((0x0))     $((0x8000))
      extract-file      xenophobe.1.grom xeno_bg.12d              $((0x8000))  $((0x8000))

      extract-file      xenophobe.2.grom xeno_fg.7j               $((0x0))     $((0x10000))
      extract-file      xenophobe.2.grom xeno_fg.8j               $((0x10000)) $((0x10000))
      extract-file      xenophobe.2.grom xeno_fg.9j               $((0x20000)) $((0x10000))
      extract-file      xenophobe.2.grom xeno_fg.10j              $((0x30000)) $((0x10000))

      dummy-file                         e36a31axnaxad.bin                     $((0xCC))
      package-zip                        xenophob.zip
    ;;

    xybots)
      deinterleave-file xybots_a.68k  136054-2112.17cd 136054-2113.19cd $((0x0))     $((0x20000))
      deinterleave-file xybots_a.68k  136054-2114.17b 136054-2115.19b   $((0x20000)) $((0x10000))

      extract-file      xybots.6502   136054-1116.2k                    $((0x0))     $((0x10000))

      extract-file      xybots.1.grom 136054-2102.12l                   $((0x0))     $((0x8000))
      extract-file      xybots.1.grom 136054-2103.11l                   $((0x8000))  $((0x10000))
      extract-file      xybots.1.grom 136054-2117.8l                    $((0x18000)) $((0x10000))

      extract-file      xybots.2.grom 136054-1105.2e                    $((0x0))     $((0x10000))
      extract-file      xybots.2.grom 136054-1106.2ef                   $((0x10000)) $((0x10000))
      extract-file      xybots.2.grom 136054-1107.2f                    $((0x20000)) $((0x10000))
      extract-file      xybots.2.grom 136054-1108.2fj                   $((0x30000)) $((0x10000))
      extract-file      xybots.2.grom 136054-1109.2jk                   $((0x40000)) $((0x10000))
      extract-file      xybots.2.grom 136054-1110.2k                    $((0x50000)) $((0x10000))
      extract-file      xybots.2.grom 136054-1111.2l                    $((0x60000)) $((0x10000))

      extract-file      xybots.3.grom 136054-1101.5c                    $((0x0))     $((0x2000))

      package-zip                     xybots.zip
    ;;
  esac
}

GAMES_LIST=(
  # Midway Arcade Origins (Xbox 360)
  # All games except Marble Madness extract correctly
  _720
  apb
  archrivals
  bubbles
  championshipsprint
  defender
  gauntlet
  gauntlet2
  joust
  joust2
  marblemadness
  pitfighter
  rampage
  rampart
  robotron
  satanshollow
  sinistar
  smashtv
  spyhunter
  spyhunter2
  stargate
  stargate.defender2
  superoffroad
  supersprint
  tapper
  toobin
  totalcarnage
  tournamentcyberball2072
  vindicators2
  wizardofwor
  xenophobe
  xybots

  # Sega XBLA games
  # NOTE: none of these will extract 100% correctly
  ABEAST16
  GAXE16
  SHINOARC
)

if [[ -f ./decompress-sr-files.sh ]]; then
  chmod +x ./decompress-sr-files.sh
  ./decompress-sr-files.sh || exit 1
fi

for i in ${GAMES_LIST[@]}; do
  ROM_DIR=$(echo $i | cut -d'.' -f1)
  [[ ! -d $ROM_DIR ]] && continue

  cd $ROM_DIR
  mkdir -p roms

  echo "Extracting $i..."
  extract-rom $i

  rm -r roms
  cd ..
done
