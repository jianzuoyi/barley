find /its1/PROJECT/lixiangfeng/Hulless_Barley/Hulless_barley_RNA_Pacbio_Data/WHHUL*/r*/Analysis_Results \
-name '*.subreads.fasta' | xargs -I {} cat {} | gzip -c > /its1/GB_BT2/jianzuoyi/workspace/barley/output/merge/Pacbio/RNA_Pacbio_Data.fasta.gz
