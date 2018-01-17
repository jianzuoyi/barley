QC=/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/fastqc
#fastqc -o ./ /its1/GB_BT2/jianzuoyi/workspace/barley/data/HiC/Rawdata/LSGMHC/LSGMHC_R1.fq.gz &
#fastqc -o ./ /its1/GB_BT2/jianzuoyi/workspace/barley/data/HiC/Rawdata/LSGMHC/LSGMHC_R2.fq.gz &
#wait

#$QC -t 24 -o /its1/GB_BT2/jianzuoyi/workspace/barley/modules/QC/FastQC /its1/GB_BT2/jianzuoyi/workspace/barley/modules/QC/LSGMHC_merged.fq.gz

cat run_fastqc_remove_adaptor.sh | parallel -j 4
