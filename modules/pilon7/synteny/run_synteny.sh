#!/bin/bash

NUCMER=/its1/GB_BT2/jianzuoyi/biosoft/mummer/bin/nucmer
REFERENCE=000001F.fa
QUERY=000001F_pilon.fa
OUTBASE=synteny
THREADS=32

$NUCMER -p $OUTBASE -t $THREADS $REFERENCE $QUERY

delta-filter -r -q -g ${OUTBASE}.delta > ${OUTBASE}.delta.filter

export PATH=/its1/GB_BT2/jianzuoyi/biosoft/mummer/bin/:/its1/GB_BT2/jianzuoyi/biosoft/gnuplot:/its1/GB_BT2/jianzuoyi/biosoft/gnuplot/bin:$PATH
mummerplot ${OUTBASE}.delta.filter -R $REFERENCE -Q $QUERY --postscript
