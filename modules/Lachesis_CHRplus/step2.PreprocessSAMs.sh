#!/bin/bash

ASM=00.reference/Hulless_barley.CHRplus.fa
BAM=10.bwa2bam/LSGM_F2048.bam

CMD=PreprocessSAMs.pl

perl $CMD $BAM $ASM
