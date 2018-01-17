#!/bin/bash

/bin/perl /its1/GB_BT2/jianzuoyi/biosoft/SSPACE-STANDARD-3.0_linux-x86_64/SSPACE_Standard_v3.0.pl \
-l /its1/GB_BT2/jianzuoyi/workspace/barley/modules/SSPACE/libraries.txt \
-s /its1/GB_BT2/jianzuoyi/workspace/barley/modules/SSPACE/all_p_pilon.fa \
-b barley_scaffolds_no_extension.g5 \
-T 8 \
-p 1 \
-g 5
