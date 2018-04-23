#!/bin/bash
set -vex

BWA=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/bwa
SAMTOOLS=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/samtools
GENOME=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/IndexBWA/p_ctg.fa
READS=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/reads/SRR1804497_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
OUTPUT=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/reads/SRR1804497.sam
THREADS=40

$BWA  mem -p -t 40 -R '@RG\tID:sample\tSM:sample' \
$GENOME \
$READS > $OUTPUT
touch /its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/reads/run_bwa.sh.done
