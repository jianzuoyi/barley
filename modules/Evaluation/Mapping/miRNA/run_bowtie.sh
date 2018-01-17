#!/bin/bash
set -vex

BOWTIE=/opt/bio/local/bin/bowtie
THREADS=4
INDEX=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/IndexBowtie/p_ctg.fa
miRNA=/its1/GB_BT2/liupeng/project/QingKe/work.v2/Result.v4/output/module3_catalog/GP_D_Rep1/GP_D_Rep1.convert.fa
OUTBASE=GP_D_Rep1
MAPPED_FASTA=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/${OUTBASE}.mapped.fa
BWT=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/${OUTBASE}.map.bwt
STAT=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/${OUTBASE}.map.stat

$BOWTIE -p $THREADS -f -v 2 -k 1 \
--al $MAPPED_FASTA \
$INDEX $miRNA $BWT 2> $STAT
