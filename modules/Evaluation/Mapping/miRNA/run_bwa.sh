#!/bin/bash
set -vex

BWA=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/bwa
DB=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/IndexBWA/p_ctg.fa
#mRNA=sample.fa
mRNA=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/mRNA.fa
THREADS=16
OUTPUT=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/mRNA2p_ctg.sam

$BWA mem -t $THREADS -R '@RG\tID:mRNA\tSM:mRNA' $DB $mRNA > $OUTPUT
