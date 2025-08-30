MODE 7
*FX 4,1
*FX 200,1
VDU 23;8202;0;0;0;
O%=0:A%=&00:X%=&01
bplus%=(USR(&FFF4) AND &FF00)=&200
IF NOT bplus% THEN PROCnotbplus
*RUN SCREEN
U%=INKEY(200)
UH$="  "+CHR$(130)
UL$="  "+CHR$(134)
HH$=CHR$(132)+CHR$(157)+CHR$(135)
HL$=CHR$(132)+CHR$(157)+CHR$(135)
TH$=CHR$(131)+CHR$(157)+CHR$(132)
TL$=CHR$(131)+CHR$(157)+CHR$(132)
START%=2+3
ROWS%=3
PROCtitle
PROCoptions
PROCselect
PROCgettitle
PROCrun
END

DEF PROCrun
IF O%=0 PROCbbcplus
IF O%=1 PROCbbcplus128
ENDPROC

DEF PROCtitle
PRINTTAB(13,2);CHR$(151);CHR$(153);"<$h h l$h,";CHR$(145);CHR$(154)
PRINTTAB(13,3);CHR$(151);CHR$(153);"w0j0j j jq";CHR$(145);CHR$(154)
PRINTTAB(13,4);CHR$(135);" COMPENDIUM";CHR$(145);CHR$(154)
VDU28,0,24,39,5
CLS
PRINT'CHR$(130);"   Elite by Ian Bell and David Braben"
PRINTCHR$(130);"       Enhancements by Mark Moxon"
PRINT'CHR$(131);"^ to select, ] for info, RETURN to play";
VDU28,0,24,39,9
ENDPROC

DEF PROCoptions
RESTORE
READ T$,V$
Y%=START%
C%=0
REPEAT
PROChl(Y%,UH$,UL$)
PROCsh(Y%,T$)
PROCsh(Y%+1,V$)
Y%=Y%+ROWS%
C%=C%+1
READ T$, V$
UNTIL T$=""
ENDPROC

DEF PROCgettitle
RESTORE
FOR L%=0 TO O%
READ T$,V$
NEXT
CLS
PROCsh(2,T$)
PROCsh(3,V$)
PROChl(2,TH$,TL$)
PRINT'
ENDPROC

DEF PROCselect
L%=(O%+1)MOD C%
REPEAT
IF O%<>L% THEN PROChl(START%+L%*ROWS%,UH$,UL$):PROChl(START%+O%*ROWS%,HH$,HL$)
L%=O%
K%=GET
IF K%=138 THEN O%=(O%+1)MOD C%
IF K%=139 THEN O%=(O%+C%-1)MOD C%
IF K%=136 OR K%=137 THEN PROCinfo
UNTIL K%=13
ENDPROC

DEF PROCbbcplus
*RUN M128Elt
ENDPROC

DEF PROCbbcplus128
CHAIN "ELITEM"
ENDPROC

DEF PROCsh(Y%,T$)
LOCAL X%
X%=21-LEN(T$)/2
PRINTTAB(X%,Y%);T$;
ENDPROC

DEF PROChl(Y%,T$,U$)
PRINTTAB(0,Y%);T$;
PRINTTAB(0,Y%+1);U$;
ENDPROC

DEF PROCinfo
PROCgettitle
PRINTTAB(0,0);CHR$(131);"       ] for menu, RETURN to play";
FOR I%=5TO13:PRINTTAB(0,I%);CHR$(134);:NEXT
PRINTTAB(0,14);CHR$(130);
PRINTTAB(0,15);CHR$(130);
IF O%=0 PROCsh(5,"The BBC Master version of Elite"):PROCsh(6,"with the following enhancements"):PROCsh(8,"Backported to run on the BBC B+")
IF O%=0 PROCsh(9,"Flicker-free ships and planets"):PROCsh(10,"Docking computer improvements"):PROCsh(11,"The epic Trumbles mission"):PROCsh(12,"Joystick and fuel scoop improvements")
IF O%=1 PROCsh(5,"The BBC B+ version of BBC Master Elite"):PROCsh(6,"with added docking and title music"):PROCsh(8,"Plus all the other Compendium features")
IF O%=1 PROCsh(10,"For the BBC Micro B+128"):PROCsh(12,"Or the BBC B+ with 16K sideways RAM")
IF O%=0 PROCsh(14,"For the BBC Micro B+ and B+128")
IF O%=1 PROCsh(14,"For the BBC B+128, or B+ with 16K SRAM")
PROCsh(15,"See www.bbcelite.com for more details")
REPEAT
K%=GET
UNTIL K%=136 OR K%=137 OR K%=13
IF K%=13 PROCgettitle:PROCrun
CLS
PROCtitle
PROCoptions
PROChl(START%+O%*ROWS%,HH$,HL$)
L%=O%
ENDPROC

DEF PROCnotbplus
PRINT"I'm sorry, this version of the Elite"
PRINT"Compendium only works on the BBC Micro"
PRINT"B+ and B+128."
PRINT'"There are separate versions available"
PRINT"for the BBC Micro and BBC Master."
PRINT'"See bbcelite.com/hacks for more details."
END
ENDPROC

DEF PROCdisablesecpro
VDU26
CLS
PRINT"Sorry, this version of Elite will not"
PRINT"run on a 6502 Second Processor."
PRINT
PRINT"Please unplug your co-processor and"
PRINT"try booting the disc again."
END
ENDPROC

DEF PROCenablesecpro
VDU26
CLS
PRINT"Sorry, this version of Elite needs a"
PRINT"6502 Second Processor."
PRINT
PRINT"Please plug in your co-processor and"
PRINT"try booting the disc again."
END
ENDPROC

REM  "----------------------------------"
DATA "BBC Master Elite on the BBC B+"
DATA "The best version of original Elite"
DATA "BBC Master Elite on the BBC B+128"
DATA "The best version... with music!"
DATA "",""
