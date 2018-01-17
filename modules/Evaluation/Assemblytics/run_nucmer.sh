#!/bin/bash
set -vex

nucmer=/its1/GB_BT2/jianzuoyi/biosoft/mummer/bin/nucmer
asm=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/falcon7/2-asm-falcon/p_ctg.fa
#asm=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/Assemblytics/sample.fa
ref=/its1/GB_BT1/xutong/QingKe/AssemblyResult/Hulless_barley.scaffold.fa
outdir=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/Assemblytics

$nucmer -t 64 -l 100 -c 500 -p ${outdir}/p_ctg $ref $asm
touch ${outdir}/run_nucmer.sh.done
