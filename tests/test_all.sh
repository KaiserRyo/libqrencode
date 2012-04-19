#!/bin/sh -e

PASSED=0
FAILED=0

usage()
{
    echo "$0 <arm|x86> [debug]"
}

if [ $# -lt 1 ] ; then
    usage
    exit
fi

CPU=$1
if [ "$CPU" = "arm" ] ; then
    VARIANT=o-le-v7
    LIB_VARIANT=so-le-v7
elif [ "$CPU" = "x86" ] ; then
    VARIANT=o
    LIB_VARIANT=so
else
    usage
    exit
fi

TEST_SUFFIX=''
if [ $# -ge 2 ] ; then
    REL_TYPE=$2
    if [ "$REL_TYPE" = "debug" ] ; then
        VARIANT=${VARIANT}-g
        LIB_VARIANT=${LIB_VARIANT}-g
        TEST_SUFFIX='_g'
    else
        usage
        exit
    fi
else
    REL_TYPE='release'
fi

# Create a link to the library with the expected version suffix
SO_VER='1'
LIB_NAME='QREncoder'
if [ ! -f ../$CPU/$LIB_VARIANT/lib${LIB_NAME}${TEST_SUFFIX}.so.${SO_VER} ] ; then
    cd ../$CPU/$LIB_VARIANT 
    ln -s lib${LIB_NAME}${TEST_SUFFIX}.so lib${LIB_NAME}${TEST_SUFFIX}.so.${SO_VER}
    cd -
fi

TEST_LIST="test_bitstream test_estimatebit test_qrencode test_qrinput test_qrspec test_rs test_split test_monkey"
for TEST in $TEST_LIST ; do
    echo "Running test: ./$TEST/$CPU/$VARIANT/${TEST}${TEST_SUFFIX}"
    LD_LIBRARY_PATH="../$CPU/$LIB_VARIANT" ./$TEST/$CPU/$VARIANT/${TEST}${TEST_SUFFIX}
    RET=$?
    if [ $RET -eq 0 ] ; then
        PASSED=$((PASSED+1))
    else
        FAILED=$((FAILED+1))
    fi
    echo "$TEST returned $RET"
done

TOTAL=$((PASSED+FAILED))
echo "$PASSED tests passed out of $TOTAL"
