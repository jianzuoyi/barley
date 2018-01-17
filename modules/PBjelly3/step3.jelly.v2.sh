#!/bin/bash
set -e

source /its1/GB_BT2/jianzuoyi/pipeline/biosoft/01.Assembly/PBSuite/PBSuite_15.8.24/env.sh

Jelly.py mapping Protocol.xml
Jelly.py support Protocol.xml
Jelly.py extraction Protocol.xml
Jelly.py assembly Protocol.xml -x "--nproc=100"
Jelly.py output Protocol.xml
