#!/bin/bash
set -vex

mkdir -p /its1/GB_BT2/jianzuoyi/workspace/barley/output/SOAPdenovo/kmer67
rm -rf /its1/GB_BT2/jianzuoyi/workspace/barley/output/SOAPdenovo/kmer67/barley*
cd /its1/GB_BT2/jianzuoyi/workspace/barley/modules/SOAPdenovo/kmer67
/its1/GB_BT2/jianzuoyi/workspace/barley/modules/SOAPdenovo/SOAPdenovo2-bin-LINUX-generic-r240/SOAPdenovo-127mer sparse_pregraph \
-s /its1/GB_BT2/jianzuoyi/workspace/barley/modules/SOAPdenovo/lib.cfg \
-o /its1/GB_BT2/jianzuoyi/workspace/barley/output/SOAPdenovo/kmer67/barley \
-K 67 \
-z 4480000000 \
-p 54
touch /its1/GB_BT2/jianzuoyi/workspace/barley/modules/SOAPdenovo/kmer67/soapdenovo_pregraph.sh.done
