#!/bin/bash

# ---------------------------------------------------------------------------------------------------
# Author: Zuoyi Jian
# Email: jianzuoyi@qq.com
# Version: 1.0    Date: 2017-07-13
# ---------------------------------------------------------------------------------------------------
SOAP=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/soap_insert/Soap/soap2.21release/soap
GENOME=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/soap_insert/00.index/Hulless_barley.scaffold.fa.index
FOFN=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/soap_insert/input.fofn
OUTDIR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/soap_insert/01.soap
mkdir -p $OUTDIR

# prepare script
while read line
do
    reads=($line)
    read1=${reads[0]}
    read2=${reads[1]}
    name=$(basename $read1 | cut -c 1-10)
    path=${OUTDIR}/${name}
    mkdir -p $path
    SH=${path}/run_soap.sh
    echo "#!/bin/bash
set -vex

$SOAP \\
-a $read1 \\
-b $read2 \\
-D $GENOME \\
-o ${name}.pe.gz \\
-2 ${name}.se.gz \\
-p 4
touch ${SH}.done" > $SH
    
    # run soap
    if [[ -n $1 && $1 == "-qsub"  ]]; then
	cd $(dirname $SH)
	qsub -cwd -S /bin/bash -l vf=10G,p=4 $SH
    fi
done < $FOFN
