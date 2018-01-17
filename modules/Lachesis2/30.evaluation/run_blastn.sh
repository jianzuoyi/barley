#!/bin/bash
set -vex

BLASTN=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/blastn
GENOME=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Lachesis2/30.evaluation/IndexBlast/Lachesis_assembly.fasta
QUERY=/its1/GB_BT1/xutong/QingKe/Annotation/Gene/mRNA.fa
OUT=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Lachesis2/30.evaluation/10.blast_mRNA/mRNA_blast.m6
THREADS=32
$BLASTN -query $QUERY -db $GENOME -qcov_hsp_perc 30 -max_target_seqs 1 -max_hsps 1 -num_threads $THREADS -outfmt "6 qaccver saccver pident length mismatch gapopen qstart qend sstart send evalue bitscore qcovhsp" -out $OUT
