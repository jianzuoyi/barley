#!/bin/bash

#unsatisfied=$(cat run_falcon.sh.o | grep unsatisfied | tail -n 1 | awk '{print $4}')
unsatisfied=$(tail -n 1000 /its1/GB_BT2/jianzuoyi/workspace/barley/modules/falcon7/run_unzip.sh.o | grep unsatisfied | tail -n1 | awk '{print $4}')
#total_jobs=$(head -1 0-rawreads/run_jobs.sh | awk '{print $4}' | sed 's/(//g' | sed 's/)//g')
#total_jobs=$(grep graph run_falcon.sh.o | tail -n1 | awk '{print $5}')
#echo Num still unsatisfied ${unsatisfied}/${total_jobs} | tee $(date +%F)-$(date +%T).done
echo Num still unsatisfied $unsatisfied \/ 7829
df -h | grep its1
