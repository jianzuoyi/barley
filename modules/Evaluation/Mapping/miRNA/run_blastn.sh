/its1/GB_BT2/jianzuoyi/biosoft/anaconda/bin/blastn \
-query /its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/mRNA.fa \
-db /its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/versions/5k.unzip.pilon/IndexBlast/all_p_pilon.fa \
-outfmt 6 \
-out /its1/GB_BT2/jianzuoyi/workspace/barley/modules/assessment/mapping/miRNA/all_p_5k.pilon.m6 \
-max_hsps 1 \
-max_target_seqs 1 \
-qcov_hsp_perc 50 \
-num_threads 40
