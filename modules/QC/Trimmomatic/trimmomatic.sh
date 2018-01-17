#!/bin/bash
set -vex

JAVA=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/java
TRIMMOMATIC_JAR=/its1/GB_BT2/jianzuoyi/pipeline/Module/QC/Trimmomatic/trimmomatic-0.36.jar
ADAPTER=ILLUMINACLIP:/its1/GB_BT2/jianzuoyi/pipeline/Module/QC/Trimmomatic/adapters/TruSeq3-PE.fa
THREADS=32
FQ1=/its1/GB_BT2/jianzuoyi/workspace/barley/data/HiC/Rawdata/LSGMHC/LSGMHC_R1.fq.gz
FQ2=/its1/GB_BT2/jianzuoyi/workspace/barley/data/HiC/Rawdata/LSGMHC/LSGMHC_R2.fq.gz
OUTDIR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/QC/Trimmomatic/output
mkdir -p $OUTDIR

out_pair1=${OUTDIR}/$(basename $FQ1 .fq.gz).clean.pair.fq.gz
out_pair2=${OUTDIR}/$(basename $FQ2 .fq.gz).clean.pair.fq.gz
out_single1=${OUTDIR}/$(basename $FQ1 .fq.gz).clean.single.fq.gz
out_single2=${OUTDIR}/$(basename $FQ2 .fq.gz).clean.single.fq.gz
trimlog=${OUTDIR}/log.trim

#$JAVA -jar $TRIMMOMATIC_JAR PE -threads $THREADS -phred33 -trimlog $trimlog $FQ1 $FQ2 $out_pair1 $out_single1 $out_pair2 $out_single2 $ADAPTER:2:30:10 SLIDINGWINDOW:5:20 LEADING:5 TRAILING:5 MINLEN:50
$JAVA -jar $TRIMMOMATIC_JAR PE -threads $THREADS -phred33 -trimlog $trimlog $FQ1 $FQ2 $out_pair1 $out_single1 $out_pair2 $out_single2 $ADAPTER:2:30:10 MINLEN:50
touch ${OUTDIR}/trimmomatic.done
