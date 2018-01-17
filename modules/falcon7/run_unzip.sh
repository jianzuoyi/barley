#!/bin/bash

cd /its1/GB_BT2/jianzuoyi/biosoft/falcon
source env.sh
cd -
fc_unzip.py fc_unzip.cfg &> run_unzip.sh.o
