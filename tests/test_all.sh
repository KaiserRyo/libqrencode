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
    LIB_DIR="../stage/armle-v7/lib"
elif [ "$CPU" = "x86" ] ; then
    VARIANT=o
    LIB_VARIANT=so
    LIB_DIR="../stage/x86/lib"
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

if [ ! -d $LIB_DIR ] ; then
    echo "Library dir ($LIB_DIR) not found"
    exit
fi

TEST_LIST="test_bitstream test_estimatebit test_mask test_mmask test_monkey test_mqrspec test_qrencode test_qrinput test_qrspec test_rs test_split"
for TEST in $TEST_LIST ; do
    echo "Running test: ./$TEST/$CPU/$VARIANT/${TEST}${TEST_SUFFIX}"
    LD_LIBRARY_PATH="$LIB_DIR" ./$TEST/$CPU/$VARIANT/${TEST}${TEST_SUFFIX}
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
