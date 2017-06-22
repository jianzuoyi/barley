find /its1/PROJECT/lixiangfeng/Hulless_Barley/Hulless_barley_RNA_NGS_Data/Clean/Z0284-R* -name '*fq.gz' | xargs -I {} zcat {} | gzip -c > /its1/GB_BT2/jianzuoyi/workspace/barley/output/merge/Pacbio/RNA_NGS_Data.fq.gz && \
touch /its1/GB_BT2/jianzuoyi/workspace/barley/modules/merge/merg_RNA_NGS_Data.sh.done
