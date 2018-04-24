#!/bin/bash

java -Dbackend.shared-filesystem.localization.1=soft-link -jar $cromwell run \
-i BAC_pipeline.inputs \
-m metadata.txt \
BAC_pipeline.wdl
