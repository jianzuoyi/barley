#!/bin/bash
lib=lib.cfg
echo -e "max_rd_len=150\n" > $lib

# single
echo "[LIB]" >> $lib
echo "asm_flags=1" >> $lib
echo "# fasta file for single reads" >> $lib
find /HOME/genebang_txu_1/BIGDATA/data/barley/illuminua/ -type f -name '*single.gz' | xargs -n1 -I {} echo f={}| sort | while read fa
do
  echo $fa >> $lib
done

# pair-end 250
find /HOME/genebang_txu_1/BIGDATA/data/barley/illuminua/ -type f -name '*pair.gz' | xargs -n1 -I {} echo p={}| sort| sed -n '1,12p' | while read fa
do
    echo "[LIB]" >> $lib
    echo "avg_ins=250" >> $lib
    echo "asm_flags=3" >> $lib
    echo "rank=1" >> $lib
    echo $fa >> $lib
    echo "" >> $lib
done

# pair-end 500
for SRR in SRR1804509 SRR1804510 SRR1804513 SRR1804514
do
    echo "[LIB]" >> $lib
    echo "avg_ins=500" >> $lib
    echo "asm_flags=3" >> $lib
    echo "rank=1" >> $lib
    find /HOME/genebang_txu_1/BIGDATA/data/barley/illuminua/ -type f -name '*pair.gz' | grep $SRR | xargs -I {} echo p={} >> $lib
    echo "" >> $lib
done

# pair-end 800
for SRR in SRR1804511 SRR1804512 SRR1804515
do
    echo "[LIB]" >> $lib
    echo "avg_ins=800" >> $lib
    echo "asm_flags=3" >> $lib
    echo "rank=1" >> $lib
    find /HOME/genebang_txu_1/BIGDATA/data/barley/illuminua/ -type f -name '*pair.gz' | grep $SRR | xargs -I {} echo p={} >> $lib
    echo "" >> $lib
done

# mate-pair 2000
for SRR in SRR1804516 SRR1804517 SRR1804518 SRR1804519
do
    echo "[LIB]" >> $lib
    echo "avg_ins=2000" >> $lib
    echo "reverse_seq=1" >> $lib
    echo "asm_flags=2" >> $lib
    echo "rank=2" >> $lib
    find /HOME/genebang_txu_1/BIGDATA/data/barley/illuminua/ -type f -name '*clean.gz' | grep $SRR | sort | awk '{print "q"NR"="$0}' >> $lib
    echo "" >> $lib
done

# mate-pair 5000
for SRR in SRR1804520 SRR1804521 SRR1804522 SRR1804523
do
    echo "[LIB]" >> $lib
    echo "avg_ins=5000" >> $lib
    echo "reverse_seq=1" >> $lib
    echo "asm_flags=2" >> $lib
    echo "rank=3" >> $lib
    find /HOME/genebang_txu_1/BIGDATA/data/barley/illuminua/ -type f -name '*clean.gz' | grep $SRR | sort | awk '{print "q"NR"="$0}' >> $lib
    echo "" >> $lib
done

# mate-pair 10000
for SRR in SRR1804524 SRR1804525 SRR1804526
do
    echo "[LIB]" >> $lib
    echo "avg_ins=10000" >> $lib
    echo "reverse_seq=1" >> $lib
    echo "asm_flags=2" >> $lib
    echo "rank=4" >> $lib
    find /HOME/genebang_txu_1/BIGDATA/data/barley/illuminua/ -type f -name '*clean.gz' | grep $SRR | sort | awk '{print "q"NR"="$0}' >> $lib
    echo "" >> $lib
done

# mate-pair 20000
for SRR in SRR1804527 SRR1804528 SRR1804529
do
    echo "[LIB]" >> $lib
    echo "avg_ins=20000" >> $lib
    echo "reverse_seq=1" >> $lib
    echo "asm_flags=2" >> $lib
    echo "rank=5" >> $lib
    find /HOME/genebang_txu_1/BIGDATA/data/barley/illuminua/ -type f -name '*clean.gz' | grep $SRR | sort | awk '{print "q"NR"="$0}' >> $lib
    echo "" >> $lib
done

# mate-pair 40000
for SRR in SRR1804530 SRR1804531 SRR1804532
do
    echo "[LIB]" >> $lib
    echo "avg_ins=40000" >> $lib
    echo "reverse_seq=1" >> $lib
    echo "asm_flags=2" >> $lib
    echo "rank=6" >> $lib
    find /HOME/genebang_txu_1/BIGDATA/data/barley/illuminua/ -type f -name '*clean.gz' | grep $SRR | sort | awk '{print "q"NR"="$0}' >> $lib
    echo "" >> $lib
done
