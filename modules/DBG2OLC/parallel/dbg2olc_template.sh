#!/bin/bash
set -vex

/its1/GB_BT2/jianzuoyi/biosoft/DBG2OLC/compiled/DBG2OLC \
LD 0 \
k 17 \
MinLen 100 \
KmerCovTh 2 \
MinOverlap 50 \
AdaptiveTh 0.01 \
RemoveChimera 1 \
Contigs /its1/GB_BT2/jianzuoyi/workspace/barley/output/SOAPdenovo/kmer67/barley.contig \
