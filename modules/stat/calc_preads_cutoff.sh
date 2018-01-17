sort -k1,1nr preads.length > preads.length
awk 'BEGIN {sum=0} {sum+=completion-ignore-case;print NR,completion-ignore-case,sum,sum/5000000000.0}' preads.length.sorted2 > preads.length.sorted2.sum
