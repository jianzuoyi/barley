#!/bin/bash
set -ex

export PATH=/its1/GB_BT2/jianzuoyi/biosoft/mummer/bin/:/its1/GB_BT2/jianzuoyi/biosoft/gnuplot:/its1/GB_BT2/jianzuoyi/biosoft/gnuplot/bin:$PATH
NUCMER=/its1/GB_BT2/jianzuoyi/biosoft/mummer/bin/nucmer
DELTAFILTER=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/delta-filter
#----------------------------------------------------------------------------
OUTBASE=LAGM
REFERENCE=/its1/GB_BT2/jianzuoyi/workspace/barley/Result/Lachesis/Lachesis_assembly.fasta
QUERY=/its1/GB_BT2/jianzuoyi/workspace/barley/data/AssemblyResult/Hulless_barley.CHRplus.fa
THREADS=96

cd /its1/GB_BT2/jianzuoyi/workspace/barley/modules/Synteny

$NUCMER -p $OUTBASE -t $THREADS $REFERENCE $QUERY
$DELTAFILTER -i 10 -l 10000 -1 ${OUTBASE}.delta > ${OUTBASE}.delta.filter
mummerplot ${OUTBASE}.delta.filter -R $REFERENCE -Q $QUERY --postscript
