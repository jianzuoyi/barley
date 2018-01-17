blastn -query sample.fa -db ../IndexBlast/p_ctg.fa -out=sample.blastn.m6 -outfmt 6 -evalue 1e-5 -perc_identity 0.97 -qcov_hsp_perc 0.10 -num_threads 32
