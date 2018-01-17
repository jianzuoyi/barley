#!/bin/bash
set -vex

BOWTIE2=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/bowtie2
THREADS=20
MAPPED_FASTA=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/mapped.fa
INDEX=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/IndexBowtie2/p_ctg.fa
miRNA=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/mRNA.fa
SAM=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/miRNA2p.sam
STDOUT=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/run_bowtie2.sh.o
STDERR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/run_bowtie2.sh.e

$BOWTIE2 -p $THREADS -f -N 1 --end-to-end -k 1 \
--al $MAPPED_FASTA \
-x $INDEX \
-U $miRNA \
-S $SAM > $STDOUT 2> $STDERR
