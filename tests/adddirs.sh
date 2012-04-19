#!/bin/sh

DIRS=" ./test_split ./test_qrspec ./test_bitstream ./test_monkey ./test_rs ./test_qrinput ./test_estimatebit ./test_qrencode"

for DIR in $DIRS ; do
    cd $DIR
    addvariant arm o-le-v7-g
    addvariant x86 o-g
    cd -
done
