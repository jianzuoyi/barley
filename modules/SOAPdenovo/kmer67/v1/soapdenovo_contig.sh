#!/bin/bash
set -vex

cd /its1/GB_BT2/jianzuoyi/workspace/barley/modules/SOAPdenovo/kmer67
/its1/GB_BT2/jianzuoyi/workspace/barley/modules/SOAPdenovo/SOAPdenovo2-bin-LINUX-generic-r240/SOAPdenovo-127mer contig \
-g /its1/GB_BT2/jianzuoyi/workspace/barley/output/SOAPdenovo/kmer67/barley \
-M 1 \
-p 54
touch /its1/GB_BT2/jianzuoyi/workspace/barley/modules/SOAPdenovo/kmer67/soapdenovo_contig.sh.done
