\ ******************************************************************************
\
\ BBC MICRO B+ ELITE COMPENDIUM DISC IMAGE SCRIPT
\
\ BBC Micro disc Elite was written by Ian Bell and David Braben and is copyright
\ Acornsoft 1984
\
\ The code in this file has been reconstructed from a disassembly of the version
\ released on Ian Bell's personal website at http://www.elitehomepage.org/
\
\ The commentary is copyright Mark Moxon, and any misunderstandings or mistakes
\ in the documentation are entirely my fault
\
\ The terminology and notations used in this commentary are explained at
\ https://elite.bbcelite.com/terminology
\
\ The deep dive articles referred to in this commentary can be found at
\ https://elite.bbcelite.com/deep_dives
\
\ ------------------------------------------------------------------------------
\
\ This source file produces the following SSD disc image:
\
\   * elite-compendium.dsd
\
\ This can be loaded into an emulator or a real BBC Micro B+.
\
\ ******************************************************************************

\ Boot files

 PUTFILE "2-assembled-output/README.txt", "README", &FFFFFF, &FFFFFF
 PUTFILE "1-source-files/boot-files/$.!BOOT.bin", "!BOOT", &FFFFFF, &FFFFFF

\ Menu

 PUTBASIC "1-source-files/menu-files/$.MENU.bas", "MENU"
 PUTFILE "1-source-files/menu-files/$.SCREEN.bin", "SCREEN", &FF7800, &FF7BE8

\ B+

 PUTFILE "elite-source-code-bbc-master/3-assembled-output/M128Elt.bin", "M128Elt", &FF1100, &FF1143
 PUTFILE "elite-source-code-bbc-master/3-assembled-output/BDATA.bin", "BDATA", &000000, &000000
 PUTFILE "elite-source-code-bbc-master/3-assembled-output/BCODE.bin", "BCODE", &FF1100, &FF2915

\ B+128

 PUTFILE "elite-source-code-bbc-master-music/3-assembled-output/M128Elt.bin", "M128ElM", &FF1100, &FF1143
 PUTFILE "elite-source-code-bbc-master-music/3-assembled-output/BCODE.bin", "MCODE", &FF1100, &FF2915
 PUTBASIC "elite-source-code-bbc-master-music/1-source-files/music/load-music.bas", "ELITEM"
 PUTFILE "elite-music/elite-music.rom", "MUSIC", &008000, &008000

\ Commander files

 PUTFILE "elite-source-code-bbc-master/1-source-files/other-files/E.MAX.bin", "E.MAX", &000000, &000000
 PUTFILE "elite-source-code-bbc-master/1-source-files/other-files/E.MISS1.bin", "E.MISS1", &000000, &000000
 PUTFILE "elite-source-code-bbc-master/1-source-files/other-files/E.MISS2.bin", "E.MISS2", &000000, &000000
