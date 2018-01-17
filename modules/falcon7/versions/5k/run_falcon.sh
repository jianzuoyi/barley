#!/bin/bash
#$ -cwd
#$ -S /bin/bash

# source build
cd /its1/GB_BT2/jianzuoyi/biosoft/FALCON-integrate
source env.sh

# naviagte to job directory
cd -

# run it!
fc_run.py fc_run.cfg logging.json 1> run_falcon.sh.o 2> run_falcon.sh.e
