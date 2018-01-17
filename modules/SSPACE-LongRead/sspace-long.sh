#!/bin/bash

PERL=/opt/bio/perl/bin/perl
SSPACE_LongRead=/its1/GB_BT2/jianzuoyi/pipeline/biosoft/01.Assembly/SSPACE/SSPACE-LongRead_v1-1/SSPACE-LongRead.pl
CONTIG=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/SSPACE2/barley_scaffolds_no_extension.g1/barley_scaffolds_no_extension.g1.final.scaffolds.fasta
PACBIO_READS=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/SSPACE-LongRead/input.fofn
THREADS=94

$PERL $SSPACE_LongRead -c $CONTIG -p $PACBIO_READS -t $THREADS
