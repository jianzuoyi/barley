#!/bin/bash

ASM=00.reference/Lachesis_assembly.fasta
BAM=10.bwa2bam/LSGM_F2048.bam

CMD=PreprocessSAMs.pl

perl $CMD $BAM $ASM
