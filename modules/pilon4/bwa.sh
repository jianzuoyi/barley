#!/bin/bash

BWA=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/bwa
SAMTOOLS=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/samtools
THREADS=32
REFERENCE=/its1/GB_BT2/jianzuoyi/database/barley/unzip.10k/all_p_ctg/p_ctg_0.fa
OUTDIR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon4/bwa_results
mkdir -p $OUTDIR

while read line
do
    cols=($line)
    insert=${cols[0]}
    fq=${cols[1]}
    name=$(basename $fq '_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz')
    echo "$BWA mem -t $THREADS -p -R '@RG\tID:${name}\tSM:barley\tLB:${insert}' $REFERENCE $fq \
| $SAMTOOLS view -b -@ $THREADS - | $SAMTOOLS sort -@ $THREADS -o ${OUTDIR}/${name}.bam -;$SAMTOOLS index ${OUTDIR}/${name}.bam"
done < input.fofn > run_bwa.sh
