#!/bin/bash
set -ex

# --------------------------------------------------------------------------------
# Author:  Zuoyi Jian
# Email:   jianzuoyi@qq.com
# Version: 1.0    Date:2071-09-14
# --------------------------------------------------------------------------------
#PILON=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/share/pilon-1.22-0/pilon-1.22.jar
PILON=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/pilon
REFERENCE=/its1/GB_BT2/jianzuoyi/database/barley/unzip.5k/IndexBWA/all_p_h_5k.unzip.fa
OUTDIR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/pilon_results
TMP_DIR=${OUTDIR}/tmp
mkdir -p $TMP_DIR
THREADS=120

$PILON -Xms900g -Xmx900g -Djava.io.tmpdir=$TMP_DIR \
--genome $REFERENCE \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804497.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804498.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804499.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804500.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804501.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804502.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804503.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804504.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804505.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804506.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804507.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804508.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804509.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804510.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804511.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804512.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804513.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804514.bam \
--frags /its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon2/results/SRR1804515.bam \
--outdir $OUTDIR \
--output $(basename $REFERENCE .unzip.fa) \
--changes \
--vcf \
--tracks \
--variant \
--chunksize 100000000 \
--diploid \
--threads $THREADS \
--K 127 \
--mindepth 20
