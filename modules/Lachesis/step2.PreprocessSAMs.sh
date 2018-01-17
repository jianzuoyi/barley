#!/bin/bash

ASM=00.reference/Barley.pbscf.fasta
BAM=11.PreprocessBam/LSGM_F2060.bam

CMD=PreprocessSAMs.pl

perl $CMD $BAM $ASM
