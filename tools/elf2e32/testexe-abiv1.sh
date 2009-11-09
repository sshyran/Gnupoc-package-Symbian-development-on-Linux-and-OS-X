#!/bin/sh

INPUT=$1

ARGS="-nocompress -sid 0x00000000 -uid1 0x1000007a -uid2 0x00000000 -uid3 0x00000000 -vid 0x00000000 -capability none -fpu softvfp -version 4.2 $INPUT"

wine $EPOCROOT/epoc32/tools/elftran.exe $ARGS e32-ref.exe 
./elftran $ARGS e32-test.exe
./bindiff e32-ref.exe e32-test.exe -i 0x14,0x18 -i 0x24,0x28
wine $EPOCROOT/epoc32/tools/elftran.exe e32-ref.exe > e32-ref-dump.txt
wine $EPOCROOT/epoc32/tools/elftran.exe e32-test.exe > e32-test-dump.txt
#rm e32-test.exe e32-ref.exe

