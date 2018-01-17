#!/bin/bash

cd /its1/GB_BT2/jianzuoyi/biosoft/falcon
source env.sh
cd -

fc_quiver.py fc_unzip.cfg &> run_quiver.sh.o
