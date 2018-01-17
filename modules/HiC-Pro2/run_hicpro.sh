#!/bin/bash

cd /its1/GB_BT2/jianzuoyi/workspace/barley/modules/HiC-Pro

HICPRO=/its1/GB_BT2/jianzuoyi/biosoft/HiC-Pro_2.9.0/bin/HiC-Pro
$HICPRO -c config-hicpro.txt -i 11.HiC_data -o 31.HiC-Pro
