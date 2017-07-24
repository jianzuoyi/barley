#!/bin/bash

LIB=lib.cfg
LIB_INSERT=barley.insert.size
DATA_DIR=/HOME/genebang_txu_1/BIGDATA/data/barley/illuminua

echo "max_rd_len=150" > $LIB

#Single
echo -e "\n[LIB]
asm_flags=1
# fasta file for single reads" >> $LIB
find $DATA_DIR -type f -name '*single.gz' | xargs -n1 -I {} echo f={}| sort | while read fa
do
  echo $fa >> $LIB
done

while read line
do
    arr=($line)
    SRR=${arr[0]}
    avg_ins=${arr[1]}
    fq=""
    if [[ $avg_ins -lt 1000 ]]; then
        asm_flags=3
    	reverse_seq=0
	fq=$(find $DATA_DIR -type f -name "${SRR}*pair.gz" | xargs -I {} echo p={})
    else
	asm_flags=2
        reverse_seq=1
  	q1=$(find $DATA_DIR -type f -name "${SRR}_1*.gz" | xargs -I {} echo q1={})
	q2=$(find $DATA_DIR -type f -name "${SRR}_1*.gz" | xargs -I {} echo q2={})
	fq="$q1
$q2"
    fi
    # Rank
    rank=0
    if [[ $avg_ins -gt 200 && $avg_ins -lt 1000 ]]; then
        rank=1
    elif [[ $avg_ins -gt 1900 && $avg_ins -lt 2100 ]]; then
	rank=2
    elif [[ $avg_ins -gt 4900 && $avg_ins -lt 5100 ]]; then
	rank=3
    elif [[ $avg_ins -gt 9900 && $avg_ins -lt 11000 ]]; then
	rank=4
    elif [[ $avg_ins -gt 19000 && $avg_ins -lt 21000 ]]; then
	rank=5
    elif [[ $avg_ins -gt 39000 && $avg_ins -lt 41000 ]]; then
    	rank=6
    fi
    
    echo -e "\n[LIB]
avg_ins=$avg_ins
asm_flags=$asm_flags
reverse_seq=$reverse_seq
rank=$rank
$fq" >> $LIB
done < $LIB_INSERT
