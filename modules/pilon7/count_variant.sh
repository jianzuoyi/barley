cat run_pilon.sh.5330.qsub/pilon_0001.sh.o185307 | grep Corrected | awk '{snp+=$2;ins+=$9;del+=$15;print "SNP: "snp,"Insertion "ins, "DELETION "del}' | tail -n 1
