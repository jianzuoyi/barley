#!/bin/bash
#set -vex

BOWTIE=/opt/bio/local/bin/bowtie
THREADS=40
INDEX=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/IndexBowtie/p_ctg.fa
BWT=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/${OUTBASE}.map.bwt
OUTDIR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA

while read miRNA
do
    outbase=$(basename $miRNA .fa)
    mapped=${OUTDIR}/${outbase}.mapped.fa
    bwt=${OUTDIR}/${outbase}.map.bwt
    stat=${OUTDIR}/${outbase}.map.stat
    echo "$BOWTIE -p $THREADS -f -v 2 -k 1 \
--al $mapped \
$INDEX $miRNA $bwt 2> $stat"
done < input.fofn
#$BOWTIE -p $THREADS -f -v 2 -k 1 \
#--al $MAPPED_FASTA \
#$INDEX $miRNA $BWT 2> $STAT
