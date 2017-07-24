#!/bin/bash
#set -vex

SOAP2_INSERT=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/soap_insert/Soap/soap_insert/soap2_insert_2.pl
WD=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/soap_insert/01.soap

while read line
do
    arr=($line)
    SRR=${arr[0]}
    insert=${arr[1]}
    SH=${WD}/${SRR}/run_soap_insert.sh
    echo $(dirname $SH)
    let min=$insert-250
    let max=$insert+250
    echo "#/bin/bash
set -vex

export GNUPLOT_PS_DIR=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/soap_insert/Soap/gnuplot/share/gnuplot/4.4/PostScript/
cd ${WD}/${SRR}
ln -sf $SOAP2_INSERT ./
perl soap2_insert_2.pl *.pe.gz *.se.gz $min $max
touch ${SH}.done" > $SH
    if [[ -n $1 && $1 == "-qsub" ]]; then
	cd $(dirname $SH)
	qsub -cwd -S /bin/bash -l vf=4G,p=1 $SH
    fi
done < barley.lib.lst
