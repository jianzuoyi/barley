cat run_pilon.sh.o184256 | grep Corrected | awk '{snp+=$2;ins+=$9;del+=$15;print "SNP: "snp,"Insertion "ins, "DELETION "del}' | tail -n 1
