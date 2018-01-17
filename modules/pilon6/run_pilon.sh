#!/bin/bash
set -ex

# --------------------------------------------------------------------------------
# Author:  Zuoyi Jian
# Email:   jianzuoyi@qq.com
# Version: 1.0    Date:2071-09-14
# --------------------------------------------------------------------------------
PILON=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/pilon
REFERENCE=/its1/GB_BT2/jianzuoyi/database/barley/unzip.5k/all_p_h/all_p_h_5k_2.fa
OUTDIR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/pilon6/pilon_results
TMP_DIR=${OUTDIR}/tmp
mkdir -p $TMP_DIR
THREADS=16

$PILON -Xms200g -Xmx200g -Djava.io.tmpdir=$TMP_DIR \
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
--output $(basename $REFERENCE .fa) \
--changes \
--vcf \
--tracks \
--variant \
--diploid \
--threads $THREADS \
--mindepth 20
