#!/bin/bash

echo -e "Sample\tTotal_reads\tMap_rate\tInsert_size"
while read sn
do
    mapped=$(awk '{print $1}' ${sn}_1.map.reads.num)	
    reads=$(cat ${sn}_1.stats | grep 'scaffold total' | awk '{print $5}')
    is=$(awk -F ',' '{sum+=$1*$2;t+=$2}END{printf "%d",sum/t}' ${sn}_1.PE2Ref.is)
    echo $sn $mapped $reads $is | awk '{printf "%s\t%d\t%.2f\t%s\n",$1,$3,$2*2*100.0/$3, $4}'
done < sample_name
