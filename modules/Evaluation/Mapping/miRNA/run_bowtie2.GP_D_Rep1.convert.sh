#!/bin/bash
set -vex

BOWTIE2=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/bowtie2
THREADS=10
MAPPED_FASTA=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/mapped.GP_D_Rep1.convert.fa
INDEX=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/IndexBowtie2/p_ctg.fa
miRNA=/its1/GB_BT2/liupeng/project/QingKe/work.v2/Result.v4/output/module3_catalog/GP_D_Rep1/GP_D_Rep1.convert.fa
SAM=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/miRNA2p.GP_D_Rep1.convert.sam
STDOUT=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/run_bowtie2.sh.GP_D_Rep1.convert.o
STDERR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/run_bowtie2.sh.GP_D_Rep1.convert.e

$BOWTIE2 -p $THREADS -N 1 -f --end-to-end -k 1 \
--al $MAPPED_FASTA \
-x $INDEX \
-U $miRNA \
-S $SAM > $STDOUT 2> $STDERR
