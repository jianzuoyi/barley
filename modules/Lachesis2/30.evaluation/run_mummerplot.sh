#!/bin/bash
set -ex

export PATH=/its1/GB_BT2/jianzuoyi/biosoft/mummer/bin/:/its1/GB_BT2/jianzuoyi/biosoft/gnuplot:/its1/GB_BT2/jianzuoyi/biosoft/gnuplot/bin:$PATH
NUCMER=/its1/GB_BT2/jianzuoyi/biosoft/mummer/bin/nucmer
DELTAFILTER=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/delta-filter
OUTBASE=$1
REFERENCE=$2
QUERY=$3
THREADS=$4

$NUCMER -p $OUTBASE -t $THREADS $REFERENCE $QUERY
#mummerplot ${OUTBASE}.delta -R $REFERENCE -Q $QUERY --postscript
#$DELTAFILTER -r -q -g ${OUTBASE}.delta > ${OUTBASE}.delta.filter
#$DELTAFILTER -r -q ${OUTBASE}.delta > ${OUTBASE}.delta.filter
#$DELTAFILTER -1 ${OUTBASE}.delta > ${OUTBASE}.delta.filter
#$DELTAFILTER -g ${OUTBASE}.delta > ${OUTBASE}.delta.filter
#$DELTAFILTER -i 10 -l 10000 -m ${OUTBASE}.delta > ${OUTBASE}.delta.filter
$DELTAFILTER -i 10 -l 10000 -1 ${OUTBASE}.delta > ${OUTBASE}.delta.filter
mummerplot ${OUTBASE}.delta.filter -R $REFERENCE -Q $QUERY --postscript
