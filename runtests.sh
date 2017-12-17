#!/bin/sh

echo "Compilando mem4disk tamanho do bloco 256 bytes tamanho do arquivo 5GB"
cc -Wall -O2 -DDATASIZE=256 -DNUMBERWRITE=20971520 -o mem4disk mem4disk.c
echo "Compilando disk4mem tamanho do bloco 256 bytes tamanho do arquivo 5GB"
cc -Wall -O2 -DDATASIZE=256 -DNUMBERWRITE=20971520 -o disk4mem disk4mem.c
echo "Testando write 256..."
time -p ./mem4disk
echo "Testando read 256..."
time -p ./disk4mem
rm mem4disk.DATA

echo "Compilando mem4disk tamanho do bloco 1K bytes tamanho do arquivo 5GB"
cc -Wall -O2 -DDATASIZE=1024 -DNUMBERWRITE=5242880 -o mem4disk mem4disk.c
echo "Compilando disk4mem tamanho do bloco 1K bytes tamanho do arquivo 5GB"
cc -Wall -O2 -DDATASIZE=1024 -DNUMBERWRITE=5242880 -o disk4mem disk4mem.c
echo "Testando write 1024..."
time -p ./mem4disk
echo "Testando read 1024..."
time -p ./disk4mem
rm mem4disk.DATA

echo "Compilando mem4disk tamanho do bloco 1M bytes tamanho do arquivo 5GB"
cc -Wall -O2 -DDATASIZE=1048576 -DNUMBERWRITE=5120 -o mem4disk mem4disk.c
echo "Compilando disk4mem tamanho do bloco 1M bytes tamanho do arquivo 5GB"
cc -Wall -O2 -DDATASIZE=1048576 -DNUMBERWRITE=5120 -o disk4mem disk4mem.c
echo "Testando write 1M..."
time -p ./mem4disk
echo "Testando read 1M..."
time -p ./disk4mem
rm mem4disk.DATA

echo "Compilando mem4disk tamanho do bloco 10M bytes tamanho do arquivo 5GB"
cc -Wall -O2 -DDATASIZE=10485760 -DNUMBERWRITE=512 -o mem4disk mem4disk.c
echo "Compilando disk4mem tamanho do bloco 10M bytes tamanho do arquivo 5GB"
cc -Wall -O2 -DDATASIZE=10485760 -DNUMBERWRITE=512 -o disk4mem disk4mem.c
echo "Testando write 10M..."
time -p ./mem4disk
echo "Testando read 10M..."
time -p ./disk4mem
rm mem4disk.DATA

echo "Compilando fork test"
cc -Wall -O2 -DMAXFORK=1000 -o fork fork.c
echo "Testando fork..."
time -p ./fork
