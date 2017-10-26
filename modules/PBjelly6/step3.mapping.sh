#!/bin/bash
set -e

source /its1/GB_BT2/jianzuoyi/pipeline/biosoft/01.Assembly/PBSuite/PBSuite_15.8.24/env.sh

mkdir -p Result
Jelly.py mapping Protocol.xml
