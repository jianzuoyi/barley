#!/bin/bash
set -vex

VARIANTCALLER=/its1/GB_BT2/jianzuoyi/biosoft/smrt_bin/variantCaller
THREADS=96
REF=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/all_p_h_10k_4212.fa
BAM=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/all_p_h_10k_4212.bam
OUT_FA=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/all_p_h_10k_4212_arrow.fasta
OUT_FQ=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/all_p_h_10k_4212_arrow.fastq
OUT_GFF=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/all_p_h_10k_4212_arrow.gff
$VARIANTCALLER --algorithm=arrow -x 5 -X 120 -q 20 -j $THREADS -r $REF -o $OUT_FA -o $OUT_FQ -o $OUT_GFF $BAM || echo arrow failed
