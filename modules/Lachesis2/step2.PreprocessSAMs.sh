#!/bin/bash

ASM=00.reference/Barley.pbscf.fasta
BAM=10.bwa2bam/LSGM_F2048.bam

CMD=PreprocessSAMs.pl

perl $CMD $BAM $ASM
