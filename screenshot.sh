#!/bin/sh

START_PAGE=1
END_PAGE=300
BOOK_NAME="bookname"

#screenshot
for PAGES in `seq -f %03g $START_PAGE $END_PAGE`
do
    echo "${PAGES}"
    ./adb shell screencap -p /storage/sdcard1/Books/$BOOK_NAME/${PAGES}.png
    sleep 1s
    ./adb shell input touchscreen tap 770 700
    sleep 1s
done

#sleep 10s

transfer png pictures from kindle to pc
for NUM in `seq -f %03g $START_PAGE $END_PAGE`
do
    echo "${NUM}"
    ./adb pull /storage/sdcard1/Books/$BOOK_NAME/${NUM}.png
#    sleep 1s
done
