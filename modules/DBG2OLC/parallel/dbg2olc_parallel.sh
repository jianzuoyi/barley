#!/bin/bash

find /its1/data/2017/04/SMJX2017FW00016/CleanData/ -type f -name '*fasta.gz' | while read fa
do
    name=1-parallel/$(basename $fa .subreads.bam.fasta.gz)
    mkdir -p $name
    sh=$(pwd)/${name}/run_dbg2olc.sh
    cp dbg2olc_template.sh $sh
    echo "f $fa
touch ${sh}.done" >> $sh
done