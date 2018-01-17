#awk '{print $1}' LSGM_allValidPairs > valid_reads.names
filterbyname.sh in=/its1/GB_BT2/jianzuoyi/workspace/barley/data/HiC_Cleandata/LSGMHC_00_R1.fastq.gz in2=/its1/GB_BT2/jianzuoyi/workspace/barley/data/HiC_Cleandata/LSGMHC_00_R2.fastq.gz out=LSGM_allValidPairs_R1.fastq.gz out2=LSGM_allValidPairs_R2.fastq.gz names=valid_reads.names include=t
