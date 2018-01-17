#!/bin/bash
set -vex

VARIANTCALLER=/its1/GB_BT2/jianzuoyi/biosoft/smrt_bin/variantCaller
THREADS=64
REF=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/all_p_h_10k_1076.fa
BAM=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/all_p_h_10k_1076.bam
OUT_FA=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/all_p_h_10k_1076.fasta
OUT_FQ=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/all_p_h_10k_1076.fastq

$VARIANTCALLER --algorithm=arrow -x 5 -X 120 -q 20 -j $THREADS -r $REF -o $OUT_FA -o $OUT_FQ $BAM || echo arrow failed
