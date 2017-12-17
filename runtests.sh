#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Uso $0 <nome do servidor>"
    exit 1
fi

echo "NAO ESQUEÇA DE EXECUTAR O NetPerfMeter NO SERVIDOR PARA O TESTE DE REDE"

echo "Compilando mem4disk tamanho do bloco 256 bytes tamanho do arquivo 2GB-256B"
cc -Wall -O2 -DDATASIZE=256 -DNUMBERWRITE=8388607 -o mem4disk mem4disk.c
echo "Compilando disk4mem tamanho do bloco 256 bytes tamanho do arquivo 2GB-256B"
cc -Wall -O2 -DDATASIZE=256 -DNUMBERWRITE=8388607 -o disk4mem disk4mem.c
echo "Testando write 256..."
time -p ./mem4disk
echo "Testando read 256..."
time -p ./disk4mem
rm mem4disk.DATA

echo "Compilando mem4disk tamanho do bloco 1K bytes tamanho do arquivo 2GB-1024B"
cc -Wall -O2 -DDATASIZE=1024 -DNUMBERWRITE=2097151 -o mem4disk mem4disk.c
echo "Compilando disk4mem tamanho do bloco 1K bytes tamanho do arquivo 2GB-1024B"
cc -Wall -O2 -DDATASIZE=1024 -DNUMBERWRITE=2097151 -o disk4mem disk4mem.c
echo "Testando write 1024..."
time -p ./mem4disk
echo "Testando read 1024..."
time -p ./disk4mem
rm mem4disk.DATA

echo "Compilando mem4disk tamanho do bloco 1M bytes tamanho do arquivo 2GB-1M"
cc -Wall -O2 -DDATASIZE=1048576 -DNUMBERWRITE=2047 -o mem4disk mem4disk.c
echo "Compilando disk4mem tamanho do bloco 1M bytes tamanho do arquivo 2GB-1M"
cc -Wall -O2 -DDATASIZE=1048576 -DNUMBERWRITE=2047 -o disk4mem disk4mem.c
echo "Testando write 1M..."
time -p ./mem4disk
echo "Testando read 1M..."
time -p ./disk4mem
rm mem4disk.DATA

echo "Compilando mem4disk tamanho do bloco 16M bytes tamanho do arquivo 2GB-16M"
cc -Wall -O2 -DDATASIZE=16777216 -DNUMBERWRITE=127 -o mem4disk mem4disk.c
echo "Compilando disk4mem tamanho do bloco 10M bytes tamanho do arquivo 2GB-16M"
cc -Wall -O2 -DDATASIZE=16777216 -DNUMBERWRITE=127 -o disk4mem disk4mem.c
echo "Testando write 16M..."
time -p ./mem4disk
echo "Testando read 16M..."
time -p ./disk4mem
rm mem4disk.DATA

echo "Compilando fork test"
cc -Wall -O2 -DMAXFORK=1000 -o fork fork.c
echo "Testando fork..."
time -p ./fork

echo "Compilando malloc test blocos 4K 128MB total"
cc -Wall -O2 -DMALLOCSIZE=4096 -DMAXMALLOC=32768 -o malloc malloc.c
echo "Testando malloc..."
time -p ./malloc

echo "Testando desempenho de rede"
echo "Testando TCP"
netperfmeter $1:9000 -tcp const0:const1460:const0:const1460 -runtime=60 > netperf.out && tail -n 33 netperf.out && rm netperf.out
echo "Testando UDP"
netperfmeter $1:9000 -udp const0:const1460:const0:const1460 -runtime=60 > netperf.out && tail -n 33 netperf.out && rm netperf.out

