#!/bin/bash
#set -vex

BOWTIE=/opt/bio/local/bin/bowtie
THREADS=8
#INDEX=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/versions/10k/IndexBowtie/p_ctg.fa
INDEX=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/versions/10k.2/unzip/IndexBowtie/all_p_ctg.fa
OUTDIR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/miRNA/all_p_ctg.10k.2.unzip
mkdir -p $OUTDIR

while read miRNA
do
    outbase=$(basename $miRNA .fa)
    mapped=${OUTDIR}/${outbase}.mapped.fa
    bwt=${OUTDIR}/${outbase}.map.bwt
    stat=${OUTDIR}/${outbase}.map.stat
    echo "$BOWTIE -p $THREADS -f -v 2 -k 1 \
--al $mapped \
$INDEX $miRNA $bwt 2> $stat"
done < input.fofn > run.sh
