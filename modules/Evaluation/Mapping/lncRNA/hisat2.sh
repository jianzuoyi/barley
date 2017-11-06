#!/bin/bash
#set -vex

hisat2=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/hisat2
samtools=/its1/GB_BT2/dongtingting/script/WholeRNA-cloud/Modules/hisat2_genome/samtools-1.3.1/bin/samtools
threads=8
split_site=/its1/GB_BT2/lingzhihao/qingke_mapping_test/splice_site.txt
index=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Evaluation/versions/10k_Arrow/IndexHisat2/barley_scaffolds_no_extension.g1.final.scaffolds.fasta
outdir=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Evaluation/Mapping/lncRNA/barley_scaffolds_no_extension.g1.final.scaffolds

while read fq
do
    reads=($fq)
    fq1=${reads[0]}
    fq2=${reads[1]}
    name=$(basename $fq1 _1.fq.gz)
    out=${outdir}/${name}
    mkdir -p $out
    sh=${out}/run_hisat2.sh
    echo "$hisat2 --threads $threads -X 1000 --dta -I 1 --rna-strandness RF -x $index -1 $fq1 -2 $fq2 \
2> ${out}/${name}.xls > /dev/null"
done < input.fofn
