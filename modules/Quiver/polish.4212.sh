#!/bin/bash
set -vex

SAMTOOLS=/its1/GB_BT2/jianzuoyi/biosoft/smrt_bin/samtools
PBALIGN=/its1/GB_BT2/jianzuoyi/biosoft/smrt_bin/pbalign
VARIANTCALLER=/its1/GB_BT2/jianzuoyi/biosoft/smrt_bin/variantCaller
REF=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/all_p_h_10k_4212.fa
INPUT_BAM_FOFN=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/input_bam.fofn
OUTDIR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver
OUT_BAM=${OUTDIR}/all_p_h_10k_4212.bam
TMP_DIR=${OUTDIR}/tmp4212
THREADS=16
mkdir -p $TMP_DIR


$SAMTOOLS faidx $REF && \
$PBALIGN --tmpDir=$TMP_DIR --nproc=$THREADS --minAccuracy=0.75 --minLength=50 \
--minAnchorSize=12 --maxDivergence=30 --concordant --algorithm=blasr --maxHits=1 \
--hitPolicy=random --seed=1 \
$INPUT_BAM_FOFN \
$REF \
$OUT_BAM && \
touch ${OUTDIR}/polish.4212.sh.done
