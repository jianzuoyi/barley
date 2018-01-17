#!/bin/bash

/bin/perl /its1/GB_BT2/jianzuoyi/biosoft/SSPACE-STANDARD-3.0_linux-x86_64/SSPACE_Standard_v3.0.pl \
-l /its1/GB_BT2/jianzuoyi/workspace/barley/modules/SSPACE/libraries.txt \
-s contigs_abyss.fasta \
-b barley_scaffolds_no_extension \
-T 32 \
-p 1 \
-g 2
