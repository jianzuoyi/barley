#!/bin/bash

BWA=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/bwa
SAMTOOLS=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/samtools
THREADS=12
REFERENCE=/its1/GB_BT2/jianzuoyi/database/barley/unzip.5k/IndexBWA/all_p_h_5k.unzip.fa
OUTDIR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results
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
