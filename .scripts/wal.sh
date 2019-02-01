#!/usr/bin/env bash

# quietly set wallpaper and theme using pywal

wal=$(which wal)
file=$1

$wal -i $file &> /dev/null
