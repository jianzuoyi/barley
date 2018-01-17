/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/bbduk.sh -Xmx10g \
in=/its1/GB_BT2/jianzuoyi/workspace/barley/data/HiC/Rawdata/LSGMHC/LSGMHC_R1.fq.gz \
in2=/its1/GB_BT2/jianzuoyi/workspace/barley/data/HiC/Rawdata/LSGMHC/LSGMHC_R2.fq.gz \
out=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/QC/bbduk2/LSGMHC_R1.clean.fq.gz \
out2=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/QC/bbduk2/LSGMHC_R2.clean.fq.gz \
ref=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/QC/adapter.fa \
ktrim=r k=23 mink=11 hdist=1 tpe tbo
