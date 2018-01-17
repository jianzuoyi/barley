#!/bin/bash
export BUSCO_CONFIG_FILE=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/busco/busco.ini
export PATH=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin:/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin:$PATH
export AUGUSTUS_CONFIG_PATH=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/pkgs/augustus-3.2.2-boost1.61_3/config

python /its1/GB_BT2/jianzuoyi/biosoft/busco/scripts/run_BUSCO.py \
-i /its1/GB_BT2/jianzuoyi/database/barley/unzip.10k.2/Assembly/p_h_ctg.fa \
-o all_p_ctg.10k.2.p_h_ctg \
-l /its1/GB_BT2/jianzuoyi/database/busco/embryophyta_odb9 \
-m genome -c 8 -f -r
