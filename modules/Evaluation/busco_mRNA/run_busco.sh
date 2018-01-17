#!/bin/bash

ln -sf /its1/GB_BT2/jianzuoyi/biosoft/WDL/cromwell-29.jar cromwell.jar
java -Dconfig.file=application.conf \
-jar cromwell.jar run \
-i busco.inputs \
-m busco.metadata \
/its1/GB_BT2/jianzuoyi/workspace/GitHub/genome_assessment/modules/busco.wdl
