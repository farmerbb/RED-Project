#!/bin/bash

ROM_LIST=(
  DigDugII.rom
  DigDug.rom
  Galaga.rom
  Galaga88.sav
  Galaxian.rom
  Mappy.rom
  MsPacMan.rom
  PacandPal.rom
  PacLand.rom
  PacMania.sav
  PacMania.org.sav
  PacManPlus.rom
  PacMan.rom
  RallyX.rom
  Rompers.sav
  RT-COLOR.rom
  SuperPacMan.rom
  SuperXevious.rom
  TheTowerofDruaga.rom
  Xevious.rom
)

MD5_LIST=(
  327b6cd567e2d060cb4fe77d424fc56f # Firmware.img
  375f370f96f3b6f033a474bc7b10fa66 # Firmware.img
  459a8b91dcae47304330660660e98364 # Super PacMan Firmware.img
  5c8b642828dac046a4678670c70a1518 # BlackPacMan_8274_firmware.img
  67a8fe555e714f4cc9ef4712b9731dec # MsPacMan_10Game_Patch.img
  7546bcafa9e5af795f816d116f58b27b # Ms_PacMan_8220_Firmware.img
  7dfe07760360a76f35c51e8ac48fc54c # Ms_PacMan_8262_Firmware.img
  ac20288a86bd85cb2a6e928b559499f2 # Ms_PacMan_8266_Firmware.img
  c898f2ed3bb288d9f9c0007f04796568 # Mega Man Firmware.img
  e1e3d98b6b41b39658a421f7e180832c # Ms_PacMan_8267_Firmware.img
)

GAMES_DIR_LIST=(
  games
  Games
  moo
)

extract-rom() {
  WORKING_FILE=$1
  case $1 in
    DigDugII.rom)
      extract-file d21_3.1d $((0x0))     $((0x4000))
      extract-file d21_1.1b $((0x4000))  $((0x4000))
      extract-file d21_4.1k $((0x8000))  $((0x2000))
      extract-file d21_5.3b $((0xA000))  $((0x1000))
      extract-file d21_6.3m $((0xB000))  $((0x4000))
      extract-file d21_7.3n $((0xF000))  $((0x4000))
      extract-file d21-5.5b $((0x13000)) $((0x20))
      extract-file d2x-7.5k $((0x13020)) $((0x100))
      extract-file d21-6.4c $((0x13120)) $((0x100))
      extract-file d21-3.3m $((0x13220)) $((0x100))
      package-zip  digdug2o.zip
    ;;

    DigDug.rom)
      check-variant 1 8d3be278355f9f6213bfc2641768efb1
      check-variant 2 c304db795e14e43d0863f50353f289f3
      extract-file dd1a.1     $((0x0))    $((0x1000))
      extract-file dd1a.2     $((0x1000)) $((0x1000))
      extract-file dd1a.3     $((0x2000)) $((0x1000))
      extract-file dd1a.4     $((0x3000)) $((0x1000))
      extract-file dd1a.5     $((0x4000)) $((0x1000))
      extract-file dd1a.6     $((0x5000)) $((0x1000))
      extract-file dd1.7      $((0x6000)) $((0x1000))
      extract-file dd1.9      $((0x7000)) $((0x800))
      extract-file dd1.11     $((0x7800)) $((0x1000))
      extract-file dd1.15     $((0x8800)) $((0x1000))
      extract-file dd1.14     $((0x9800)) $((0x1000))
      extract-file dd1.13     $((0xA800)) $((0x1000))
      extract-file dd1.12     $((0xB800)) $((0x1000))
      extract-file dd1.10b    $((0xC800)) $((0x1000))
      extract-file 136007.113 $((0xD800)) $((0x20))
      extract-file 136007.112 $((0xD820)) $((0x100))
      extract-file 136007.111 $((0xD920)) $((0x100))
      extract-file 136007.110 $((0xDA20)) $((0x100))
      dummy-file   136007.109             $((0x100))
      package-zip  digdug.zip
    ;;

    Galaga.rom)
      check-unusable && (
        extract-file gg1_1b.3p $((0x0))    $((0x1000))
        extract-file gg1_2b.3m $((0x1000)) $((0x1000))
        extract-file gg1_3.2m  $((0x2000)) $((0x1000))
        extract-file gg1_4b.2l $((0x3000)) $((0x1000))
        extract-file gg1_5b.3f $((0x4000)) $((0x1000))
        extract-file gg1_7b.2c $((0x5000)) $((0x1000))
        extract-file gg1_9.4l  $((0x6000)) $((0x1000))
        extract-file gg1_11.4d $((0x7000)) $((0x1000))
        extract-file gg1_10.4f $((0x8000)) $((0x1000))
        extract-file prom-5.5n $((0x9000)) $((0x20))
        extract-file prom-3.1c $((0x9020)) $((0x100))
        extract-file prom-4.2n $((0x9120)) $((0x100))
        extract-file prom-1.1d $((0x9220)) $((0x100))
        dummy-file   prom-2.5c             $((0x100))
        package-zip  galaga.zip
      )
    ;;

    Galaga88.sav)
      copy-file   cus64-64a1.mcu NS1-MCU.rom
      copy-file   g8_chr-0.bin   G8-CHR0.rom
      copy-file   g8_chr-1.bin   G8-CHR1.rom
      copy-file   g8_chr-2.bin   G8-CHR2.rom
      copy-file   g8_chr-3.bin   G8-CHR3.rom
      copy-file   g8_chr-8.bin   G8-CHR8.rom
      copy-file   g8_obj-0.bin   G8-OBJ0.rom
      copy-file   g8_obj-1.bin   G8-OBJ1.rom
      copy-file   g8_obj-2.bin   G8-OBJ2.rom
      copy-file   g8_obj-3.bin   G8-OBJ3.rom
      copy-file   g8_obj-4.bin   G8-OBJ4.rom
      copy-file   g8_obj-5.bin   G8-OBJ5.rom
      copy-file   g81_p0.bin     G8-PRG0.rom
      copy-file   g81_p1.bin     G8-PRG1.rom
      copy-file   g81_p5.bin     G8-PRG5.rom
      copy-file   g82_p6.bin     G8-PRG6.rom
      copy-file   g82_p7.bin     G8-PRG7.rom
      copy-file   g81_s0.bin     G8-SND0.rom
      copy-file   g81_s1.bin     G8-SND1.rom
      copy-file   g81_v0.bin     G8-VOI0.rom
      copy-file   g81_v1.bin     G8-VOI1.rom
      copy-file   g81_v2.bin     G8-VOI2.rom
      copy-file   g81_v3.bin     G8-VOI3.rom
      copy-file   g81_v4.bin     G8-VOI4.rom
      copy-file   g81_v5.bin     G8-VOI5.rom
      package-zip galaga88.zip
    ;;

    Galaxian.rom)
      extract-file galmidw.u $((0x0))    $((0x800))
      extract-file galmidw.v $((0x800))  $((0x800))
      extract-file galmidw.w $((0x1000)) $((0x800))
      extract-file galmidw.y $((0x1800)) $((0x800))
      extract-file 7l        $((0x2000)) $((0x800))
      extract-file 1h.bin    $((0x2800)) $((0x800))
      extract-file 1k.bin    $((0x3000)) $((0x800))
      extract-file 6l.bpr    $((0x3800)) $((0x20))
      package-zip  galaxian.zip
    ;;

    Mappy.rom)
      check-variant 1 598e8efde55b08ab5c9370315e4c5c64
      check-variant 2 a26d20ec53af00c48b365021728a498b
      extract-file mpx_3.1d $((0x0))    $((0x2000))
      extract-file mp1_2.1c $((0x2000)) $((0x2000))
      extract-file mpx_1.1b $((0x4000)) $((0x2000))
      extract-file mp1_4.1k $((0x6000)) $((0x2000))
      extract-file mp1_5.3b $((0x8000)) $((0x1000))
      extract-file mp1_6.3m $((0x9000)) $((0x2000))
      extract-file mp1_7.3n $((0xB000)) $((0x2000))
      extract-file mp1-5.5b $((0xD000)) $((0x20))
      extract-file mp1-7.5k $((0xD020)) $((0x100))
      extract-file mp1-6.4c $((0xD120)) $((0x100))
      extract-file mp1-3.3m $((0xD220)) $((0x100))
      package-zip  mappy.zip
    ;;

    MsPacMan.rom)
      check-variant 1 e8fa67dc354487ecaead5185f702ac58
      check-variant 2 fd6567dc1ad03f04646908365edcef60
      extract-file boot1     $((0x0))    $((0x1000))
      extract-file boot2     $((0x1000)) $((0x1000))
      extract-file boot3     $((0x2000)) $((0x1000))
      extract-file boot4     $((0x3000)) $((0x1000))
      extract-file boot5     $((0x4000)) $((0x1000))
      extract-file boot6     $((0x5000)) $((0x1000))
      extract-file 5e        $((0x6000)) $((0x1000))
      extract-file 5f        $((0x7000)) $((0x1000))
      extract-file 82s123.7f $((0x8000)) $((0x20))
      extract-file 82s126.4a $((0x8020)) $((0x100))
      extract-file 82s126.1m $((0x8120)) $((0x100))
      dummy-file   82s126.3m             $((0x100))
      package-zip  mspacmab.zip
    ;;

    PacandPal.rom)
      extract-file pap1-3b.1d $((0x0))    $((0x2000))
      extract-file pap1-2b.1c $((0x2000)) $((0x2000))
      extract-file pap3-1.1b  $((0x4000)) $((0x2000))
      extract-file pap1-4.1k  $((0x6000)) $((0x1000))
      extract-file pap1-6.3c  $((0x7000)) $((0x1000))
      extract-file pap1-5.3f  $((0x8000)) $((0x2000))
      extract-file pap1-6.4c  $((0xA000)) $((0x20))
      extract-file pap1-4.3l  $((0xA020)) $((0x100))
      extract-file pap1-5.4e  $((0xA120)) $((0x100))
      extract-file pap1-3.3m  $((0xA220)) $((0x100))
      package-zip  pacnpal.zip
    ;;

    PacLand.rom)
      check-variant 1 5df503b74b0be44ffa1ca0cede81f5f0
      check-variant 2 097f7ce6874bdee73a722e52a38d57e1
      extract-file pl5_01b.8b     $((0x0))     $((0x4000))
      extract-file pl5_02.8d      $((0x4000))  $((0x4000))
      extract-file pl1_3.8e       $((0x8000))  $((0x4000))
      extract-file pl1_4.8f       $((0xC000))  $((0x4000))
      extract-file pl1_5.8h       $((0x10000)) $((0x4000))
      extract-file pl3_6.8j       $((0x14000)) $((0x4000))
      extract-file pl1_7.3e       $((0x18000)) $((0x2000))
      extract-file cus60-60a1.mcu $((0x1A000)) $((0x1000))
      extract-file pl2_12.6n      $((0x1B000)) $((0x2000))
      extract-file pl4_13.6t      $((0x1D000)) $((0x2000))
      extract-file pl1-9.6f       $((0x1F000)) $((0x4000))
      extract-file pl1-8.6e       $((0x23000)) $((0x4000))
      extract-file pl1-10.7e      $((0x27000)) $((0x4000))
      extract-file pl1-11.7f      $((0x2B000)) $((0x4000))
      extract-file pl1-2.1t       $((0x2F000)) $((0x400))
      extract-file pl1-1.1r       $((0x2F400)) $((0x400))
      extract-file pl1-5.5t       $((0x2F800)) $((0x400))
      extract-file pl1-4.4n       $((0x2FC00)) $((0x400))
      extract-file pl1-3.6l       $((0x30000)) $((0x400))
      package-zip  pacland.zip
    ;;

    PacMania.sav | PacMania.org.sav)
      check-variant 1 4e48337a4605a54a20a47cbbcc49472d
      check-variant 2 122164d8b0b341eca98960b0ac0f3c58
      copy-file   cus64-64a1.mcu NS1-MCU.rom
      copy-file   pn_chr-0.bin   PM-CHR0.rom
      copy-file   pn_chr-1.bin   PM-CHR1.rom
      copy-file   pn_chr-2.bin   PM-CHR2.rom
      copy-file   pn_chr-3.bin   PM-CHR3.rom
      copy-file   pn2_c8.bin     PM-CHR8.rom
      copy-file   pn_obj-0.bin   PM-OBJ0.rom
      copy-file   pnx_obj1.bin   PM-OBJ1.rom
      copy-file   pn_prg-6.bin   PM-PRG6.rom
      copy-file   pn2_p7.bin     PM-PRG7.rom
      copy-file   pn2_s0.bin     PM-SND0.rom
      copy-file   pn2_s1.bin     PM-SND1.rom
      copy-file   pn2_v0.bin     PM-VOI0.rom
      package-zip pacmania.zip
    ;;

    PacManPlus.rom | PacMan.rom)
      extract-file pacman.6e $((0x0))    $((0x1000))
      extract-file pacman.6f $((0x1000)) $((0x1000))
      extract-file pacman.6h $((0x2000)) $((0x1000))
      extract-file pacman.6j $((0x3000)) $((0x1000))
      extract-file pacman.5e $((0x4000)) $((0x1000))
      extract-file pacman.5f $((0x5000)) $((0x1000))
      extract-file 82s123.7f $((0x6000)) $((0x20))
      extract-file 82s126.4a $((0x6020)) $((0x100))
      extract-file 82s126.1m $((0x6120)) $((0x100))
      dummy-file   82s126.3m             $((0x100))

      [[ $1  = *Plus* ]] && package-zip pacman.plus.zip
      [[ $1 != *Plus* ]] && package-zip pacman.zip
    ;;

    RallyX.rom)
      extract-file 1b         $((0x0))    $((0x1000))
      extract-file rallyxn.1e $((0x1000)) $((0x1000))
      extract-file rallyxn.1h $((0x2000)) $((0x1000))
      extract-file rallyxn.1k $((0x3000)) $((0x1000))
      extract-file 8e         $((0x4000)) $((0x1000))
      extract-file rx1-1.11n  $((0x5000)) $((0x20))
      extract-file rx1-7.8p   $((0x5020)) $((0x100))
      extract-file rx1-5.3p   $((0x5120)) $((0x100))
      extract-file rx1-6.8m   $((0x5220)) $((0x100))
      dummy-file   rx1-3.7k               $((0x20))
      dummy-file   rx1-4.2m               $((0x100))
      dummy-file   rx1-2.4n               $((0x20))
      package-zip  rallyx.zip
    ;;

    RT-COLOR.rom)
      extract-file rt1-1.3r       $((0x0))    $((0x200))
      extract-file rt1-2.3s       $((0x200))  $((0x200))
      extract-file rt1-3.4v       $((0x400))  $((0x800))
      extract-file rt1-4.5v       $((0xC00))  $((0x800))
      extract-file rt1-5.6u       $((0x1400)) $((0x20))
      copy-file    cus60-60a1.mcu NS86MCU.rom
      copy-file    rt1_7.7r       RT-CHR0.rom
      copy-file    rt1_8.7s       RT-CHR1.rom
      copy-file    rt1_5.4r       RT-CHR2.rom
      copy-file    rt1_6.4s       RT-CHR3.rom
      copy-file    rt3_1b.9c      RT-MPR0.rom
      copy-file    rt1_17.f1      RT-MPR1.rom
      copy-file    rt1_18.h1      RT-MPR2.rom
      copy-file    rt3_19.k1      RT-MPR3.rom
      copy-file    rt3_20.m1      RT-MPR4.rom
      copy-file    rt1_9.12h      RT-OBJ0.rom
      copy-file    rt1_10.12k     RT-OBJ1.rom
      copy-file    rt1_11.12l     RT-OBJ2.rom
      copy-file    rt1_12.12m     RT-OBJ3.rom
      copy-file    rt1_13.12p     RT-OBJ4.rom
      copy-file    rt1_14.12r     RT-OBJ5.rom
      copy-file    rt1_15.12t     RT-OBJ6.rom
      copy-file    rt1_16.12u     RT-OBJ7.rom
      copy-file    rt3_2b.12c     RT-SPR0.rom
      copy-file    rt3_3.12d      RT-SPR1.rom
      copy-file    rt1_21.f3      RT-VOI0.rom
      copy-file    rt2_22.h3      RT-VOI1.rom
      copy-file    rt3_4.6b       RT-XMCU.rom
      package-zip  rthunder.zip
    ;;

    Rompers.sav)
      copy-file   cus64-64a1.mcu NS1-MCU.rom
      copy-file   rp_chr-0.bin   RO-CHR0.rom
      copy-file   rp_chr-1.bin   RO-CHR1.rom
      copy-file   rp_chr-2.bin   RO-CHR2.rom
      copy-file   rp_chr-3.bin   RO-CHR3.rom
      copy-file   rp1_chr8.bin   RO-CHR8.rom
      copy-file   rp_obj-0.bin   RO-OBJ0.rom
      copy-file   rp_obj-1.bin   RO-OBJ1.rom
      copy-file   rp_obj-2.bin   RO-OBJ2.rom
      copy-file   rp_obj-3.bin   RO-OBJ3.rom
      copy-file   rp_obj-4.bin   RO-OBJ4.rom
      copy-file   rp1_obj5.bin   RO-OBJ5.rom
      copy-file   rp1_obj6.bin   RO-OBJ6.rom
      copy-file   rp1_prg4.bin   RO-PRG4.rom
      copy-file   rp1_prg5.bin   RO-PRG5.rom
      copy-file   rp1prg6b.bin   RO-PRG6.rom
      copy-file   rp1prg7b.bin   RO-PRG7.rom
      copy-file   rp1_snd0.bin   RO-SND0.rom
      copy-file   rp_voi-0.bin   RO-VOI0.rom
      package-zip rompers.zip
    ;;

    SuperPacMan.rom)
      extract-file sp1-2.1c    $((0x0))    $((0x2000))
      extract-file sp1-1.1b    $((0x2000)) $((0x2000))
      extract-file spc-3.1k    $((0x4000)) $((0x1000))
      extract-file sp1-6.3c    $((0x5000)) $((0x1000))
      extract-file spv-2.3f    $((0x6000)) $((0x2000))
      extract-file superpac.4c $((0x8000)) $((0x20))
      extract-file superpac.3l $((0x8020)) $((0x100))
      extract-file superpac.4e $((0x8120)) $((0x100))
      extract-file superpac.3m $((0x8220)) $((0x100))
      package-zip  superpac.zip
    ;;

    SuperXevious.rom)
      check-unusable && (
        check-variant 1 772f5eb270295738b53126f776285386
        check-variant 2 cb300927c3d905edfdfd2afbd4dbf089
        extract-file cpu_3p.rom $((0x0))    $((0x1000))
        extract-file cpu_3m.rom $((0x1000)) $((0x1000))
        extract-file xv3_3.2m   $((0x2000)) $((0x1000))
        extract-file xv3_4.2l   $((0x3000)) $((0x1000))
        extract-file xv3_5.3f   $((0x4000)) $((0x1000))
        extract-file xv3_6.3j   $((0x5000)) $((0x1000))
        xevious-shared
        package-zip  sxevious.zip
      )
    ;;

    TheTowerofDruaga.rom)
      extract-file td2_3.1d $((0x0))    $((0x4000))
      extract-file td2_1.1b $((0x4000)) $((0x4000))
      extract-file td1_4.1k $((0x8000)) $((0x2000))
      extract-file td1_5.3b $((0xA000)) $((0x1000))
      extract-file td1_6.3m $((0xB000)) $((0x2000))
      extract-file td1_7.3n $((0xD000)) $((0x2000))
      extract-file td1-5.5b $((0xF000)) $((0x20))
      extract-file td1-7.5k $((0xF020)) $((0x400))
      extract-file td1-6.4c $((0xF420)) $((0x100))
      extract-file td1-3.3m $((0xF520)) $((0x100))
      package-zip  todruaga.zip
    ;;

    Xevious.rom)
      check-unusable && (
        check-variant 1 99a8fa5752e95a6f09173bb1e55a8ef4
        check-variant 2 1d6eb62c695c82f01b5d00ce000c179f
        extract-file xvi_1.3p  $((0x0))     $((0x1000))
        extract-file xvi_2.3m  $((0x1000))  $((0x1000))
        extract-file xvi_3.2m  $((0x2000))  $((0x1000))
        extract-file xvi_4.2l  $((0x3000))  $((0x1000))
        extract-file xvi_5.3f  $((0x4000))  $((0x1000))
        extract-file xvi_6.3j  $((0x5000))  $((0x1000))
        xevious-shared
        package-zip  xevious.zip
      )
    ;;
  esac
}

xevious-shared() {
  extract-file xvi_7.2c  $((0x6000))  $((0x1000))
  extract-file xvi_9.2a  $((0x7000))  $((0x1000))
  extract-file xvi_10.2b $((0x8000))  $((0x2000))
  extract-file xvi_11.2c $((0xA000))  $((0x1000))
  extract-file xvi_12.3b $((0xB000))  $((0x1000))
  extract-file xvi_13.3c $((0xC000))  $((0x1000))
  extract-file xvi_14.3d $((0xD000))  $((0x1000))
  extract-file xvi_15.4m $((0xE000))  $((0x2000))
  extract-file xvi_17.4p $((0x10000)) $((0x2000))
  extract-file xvi_16.4n $((0x12000)) $((0x1000))
  extract-file xvi_18.4r $((0x13000)) $((0x2000))
  dummy-file   xvi-1.5n               $((0x100))

  FILESIZE=$(stat -c%s "$WORKING_FILE")
  if [[ $FILESIZE = 89088 ]]; then
    extract-file xvi-8.6a  $((0x15000)) $((0x100))
    extract-file xvi-9.6d  $((0x15100)) $((0x100))
    extract-file xvi-10.6e $((0x15200)) $((0x100))
    extract-file xvi-7.4h  $((0x15300)) $((0x200))
    extract-file xvi-6.4f  $((0x15500)) $((0x200))
    extract-file xvi-4.3l  $((0x15700)) $((0x200))
    extract-file xvi-5.3m  $((0x15900)) $((0x200))
    extract-file xvi-2.7n  $((0x15B00)) $((0x100))
  fi

  if [[ $FILESIZE = 88064 ]]; then
    # TODO last 2048 bytes are unusable (or encrypted) data.
    # Figure out how to extract properly (if possible)
    true
  fi
}

extract-file() {
  dd if="$WORKING_FILE" of="$WORKING_DIR/roms/$1" skip=$2 count=$3 status=none iflag=skip_bytes,count_bytes
}

copy-file() {
  dd if="$2" of="$WORKING_DIR/roms/$1" status=none
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

check-variant() {
  [[ "$WORKING_FILE" = *.sav ]] && FILE_TO_CHECK=PM-CHR0.rom
  [[ "$WORKING_FILE" = *.rom ]] && FILE_TO_CHECK="$WORKING_FILE"
  MD5=$(md5sum "$FILE_TO_CHECK" | cut -d" " -f1)
  [[ $MD5 = $2 ]] && echo "Note: extracting variant #$1 of $WORKING_FILE"
}

check-unusable() {
  [[ $EXTRACT_ALL != 1 ]] && return 1
  [[ $EXTRACT_ALL = 1 ]] && \
    echo "Note: $WORKING_FILE produces an unusable ROM" && return 0
}

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
  echo "Usage: $0 <firmware-image> [-a]"
  echo
  echo "  <firmware-image> is the path to a firmware image from"
  echo "  the \"Updater\" folder of the firmware update zip file."
  echo
  echo "  -a option extracts all ROMs, including unusable ones."
  exit 1
}

#####################################################################################

[[ $# -eq 0 || $1 = "--help" || $1 = "-h" ]] && \
  print-usage "Extracts arcade and NES ROMs from Arcade1Up firmware images."

IMG_PATH=$(realpath "$1")
[[ ! -f "$IMG_PATH" ]] && print-usage "Firmware image path is incorrect."
[[ $(head -c8 "$IMG_PATH" | grep IMAGEWTY) = IMAGEWTY ]] && IS_ALLWINNER_IMAGE=1
[[ $2 = "-a" ]] && EXTRACT_ALL=1

echo "Checking dependencies..."
SCRIPT_DIR=$(pwd $(dirname "$0"))
[[ $IS_ALLWINNER_IMAGE = 1 ]] && \
  [[ ! -f "$SCRIPT_DIR/awimage" ]] && \
  missing-dependency-awimage

[[ -z $(which guestmount) ]] && missing-dependency libguestfs-tools
[[ -z $(which zip) ]] && missing-dependency zip

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
mkdir -p "$WORKING_DIR/roms"
mkdir -p "$WORKING_DIR/zips"

START_DIR="$PWD"
cd "$WORKING_DIR"

if [[ $IS_ALLWINNER_IMAGE = 1 ]]; then
  echo "Extracting firmware image using awimage..."
  cp "$SCRIPT_DIR/awimage" .
  chmod +x awimage
  ./awimage "$IMG_PATH" firmware >/dev/null 2>&1

  echo "Mounting firmware image using guestmount..."
  guestmount -a firmware/RFSFAT16_ROOTFS_FEX000000 -m /dev/sda --ro mnt
else
  echo "Mounting firmware image using guestmount..."
  guestmount -a "$IMG_PATH" -m /dev/sda5 --ro mnt
fi

echo "Locating games inside firmware image..."
for i in ${GAMES_DIR_LIST[@]}; do
  [[ -d mnt/$i ]] && GAMES_DIR="$WORKING_DIR/mnt/$i"
done

cd "$GAMES_DIR"
[[ -f MegaMan.nes ]] && for i in *.nes; do
  echo "Extracting $i..." && cp "$i" "$WORKING_DIR/zips"
done

for i in ${ROM_LIST[@]}; do
  [[ -f $i ]] && echo "Extracting $i..." && extract-rom $i
done

echo "Cleaning up..."
cd "$START_DIR"
mv "$WORKING_DIR/zips"/* .
umount "$WORKING_DIR/mnt"
rm -r "$WORKING_DIR"
rm -r /var/tmp/.guestfs-$UID

echo "Done!"
