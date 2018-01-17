awk 'BEGIN{OFS="\t"}{print $1, $NF}' Assembly_MboI.txt > Assembly.chrom.sizes
