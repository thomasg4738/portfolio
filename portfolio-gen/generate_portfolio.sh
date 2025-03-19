#!/bin/bash

# 写一个循环，生成从 2 开始到 $1 的所有 portfolio
# 生成 portfolio N 的命令是 cargo r -- $N > ../sources/portfolio$N.move
# $1 不能为空，不能小于2

if [ -z $1 ]
then
    echo "Please input the number of portfolios you want to generate."
    exit 1
fi

if [ $1 -lt 2 ]
then
    echo "The argument must be greater than 1."
    exit 1
fi

for i in $(seq 2 $1)
do
    cargo r -- $i > ../sources/portfolio$i.move
done