#!/bin/bash
set -ev

cd /its1/GB_BT2/jianzuoyi/workspace/barley/modules/Lachesis

BWA=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/bwa
SAMTOOLS=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/samtools

REF=00.reference/Barley.pbscf.fasta
FQ1=10.bwa2bam/p_1_1.fastq.gz
FQ2=10.bwa2bam/p_1_2.fastq.gz
OUTDIR=10.bwa2bam
OUTBASE=LSGM
THREADS=96

$BWA index $REF
$BWA mem -t $THREADS -R '@RG\tID:LSGM\tSM:LSGM\tLB:Lib1' $REF $FQ1 $FQ2 | $SAMTOOLS view -hbF 2060  -o ${OUTDIR}/${OUTBASE}_F2052.bam -
