#!/bin/bash

/bin/perl /its1/GB_BT2/jianzuoyi/pipeline/biosoft/01.Assembly/SSPACE/SSPACE-STANDARD-3.0_linux-x86_64/SSPACE_Standard_v3.0.pl \
-l /its1/GB_BT2/jianzuoyi/workspace/barley/modules/SSPACE2/libraries.txt \
-s /its1/GB_BT2/jianzuoyi/workspace/barley/modules/Quiver/all_p_arrow.fasta \
-b barley_scaffolds_g1_extension \
-T 64 \
-p 1 \
-x 1
