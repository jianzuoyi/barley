#!/bin/bash
set -vex

# --------------------------------------------------------------------------------------
# Author:      Zuoyi Jian
# Email:       jianzuoyi@qq.com
# Description: Assessment of genome assembly using BUSCO system
# Date:        2017-07-05
# Version:     1.0
# --------------------------------------------------------------------------------------
export BUSCO_CONFIG_FILE=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/busco/config.ini
export PATH=/opt/bio/augustus-3.2.3/bin/:$PATH
export PATH=/opt/bio/augustus-3.2.3/scripts/:$PATH
export AUGUSTUS_CONFIG_PATH=/its1/GB_BT2/jianzuoyi/workspace/pepper/modules/biosoft/busco/config/augustus/config/
OrthoDB=/its1/GB_BT2/jianzuoyi/workspace/pepper/modules/biosoft/busco/OrthoDB/embryophyta_odb9
BUSCO=/its1/GB_BT2/jianzuoyi/workspace/pepper/modules/biosoft/busco/scripts/run_BUSCO.py
# --------------------------------------------------------------------------------------
GENOME=/its1/GB_BT1/xutong/QingKe/AssemblyResult/Hulless_barley.scaffold.fa
OUTBASE=barley.scaffold
THREADS=20
# --------------------------------------------------------------------------------------
python $BUSCO \
-i $GENOME \
-o $OUTBASE \
-l $OrthoDB \
-m genome \
-c $THREADS \
-f \
-r
touch run_busco_${OUTBASE}_done
