#!/bin/bash


juicer_dir=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Juicer/juicer
topdir=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Juicer
genome=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Juicer/juicer/references/scaffolds.fasta
chrom_size=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Juicer/juicer/restriction_sites/Assembly.chrom.sizes
enzyme_cut=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Juicer/juicer/restriction_sites/Assembly_MboI.txt
threads=64

bash ${juicer_dir}/juicer.sh -g Assembly -z $genome -p $chrom_size -y $enzyme_cut -s MboI -t $threads -d $topdir -D $juicer_dir
