#!/bin/bash
export BUSCO_CONFIG_FILE=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/busco/busco.ini
export PATH=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin:/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin:$PATH
export AUGUSTUS_CONFIG_PATH=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/pkgs/augustus-3.2.2-boost1.61_3/config

python3 /its1/GB_BT2/jianzuoyi/biosoft/busco/scripts/run_BUSCO.py \
-i /its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/busco/contig1.fa \
-o contig1 \
-l /its1/GB_BT2/jianzuoyi/database/busco/embryophyta_odb9 \
-m genome -c 24 -f -r
