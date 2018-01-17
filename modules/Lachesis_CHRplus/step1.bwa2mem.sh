#!/bin/bash
set -ev

cd /its1/GB_BT2/jianzuoyi/workspace/barley/modules/Lachesis_CHRplus
pwd

BWA=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/bwa
SAMTOOLS=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/samtools

REF=00.reference/Hulless_barley.CHRplus.fa
FQ1=10.bwa2bam/HIC_R1.fq.gz
FQ2=10.bwa2bam/HIC_R2.fq.gz
OUTDIR=10.bwa2bam
OUTBASE=LSGM
THREADS=32

$BWA index $REF
$BWA mem -t $THREADS -R '@RG\tID:LSGM\tSM:LSGM\tLB:Lib1' $REF $FQ1 $FQ2 | $SAMTOOLS view -@ $THREADS -hbF 2048 - | $SAMTOOLS sort -@ $THREADS -o ${OUTDIR}/${OUTBASE}_F2048.bam -
