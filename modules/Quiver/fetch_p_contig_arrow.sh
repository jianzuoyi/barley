bioawk -c fastx '$name!~"_"{print ">"$name;print $seq}' all_p_h.arrow.fasta > all_p_arrow.fasta
