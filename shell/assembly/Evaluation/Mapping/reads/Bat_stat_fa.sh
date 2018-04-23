#!/bin/bash

ITOOLS=/its1/GB_BT2/jianzuoyi/pipeline/Module/bin/iTools

while read fa
do
    sn=$(basename $fa .fastq.gz.clean.dup.clean.gz.cor.pair.gz)
    echo "stats.sh $fa > ${sn}.stats"
done < input.fofn
