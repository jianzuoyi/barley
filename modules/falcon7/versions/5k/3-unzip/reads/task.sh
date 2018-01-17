#!/bin/bash
hostname
env | sort
pwd
time python2.7 -m pypeflow.do_task  /its1/GB_BT2/jianzuoyi/workspace/barley/modules/falcon7/3-unzip/reads/task.json
