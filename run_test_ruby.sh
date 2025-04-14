#!/bin/bash

file_path=$1
row_number=$2

line=$(sed "${row_number}q;d" $file_path)

if [[ $line == *should* || $line == *context* ]]; then
    test_name=$(echo $line | grep -o "'.*'" | sed "s/'//g")
    bin/rails test $file_path -n "/$test_name/"
else
    bin/rails test $file_path
fi

