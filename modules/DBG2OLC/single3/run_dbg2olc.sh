#!/bin/bash
set -vex

sh=$0

/its1/GB_BT2/jianzuoyi/biosoft/DBG2OLC/compiled/DBG2OLC \
LD 0 \
k 17 \
MinLen 200 \
KmerCovTh 6 \
MinOverlap 100 \
AdaptiveTh 0.01 \
RemoveChimera 1 \
Contigs /its1/GB_BT2/jianzuoyi/workspace/barley/output/SOAPdenovo/kmer67/barley.contig \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170313_021230.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170313_222122.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170331_104858.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170331_204824.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170401_125657.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170401_225624.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170403_024100.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170403_124015.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170403_225007.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170404_085947.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170405_052454.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170405_152408.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170406_202816.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170407_112438.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170407_212411.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170408_073341.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170408_174317.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170409_081709.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54143_170409_181623.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170323_150344.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170324_011305.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170324_112230.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170401_065701.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170401_170625.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170402_084239.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170402_184150.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170403_045141.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170403_150113.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170404_064017.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170404_163942.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170405_084530.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170406_102459.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170406_202418.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170407_121652.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170407_221613.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170408_082536.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170408_183505.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170409_082015.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54148_170409_181928.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170313_050219.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170315_015621.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170315_115538.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170315_220503.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170316_081437.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170323_145527.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170324_010816.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170324_111800.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170401_050949.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170401_150904.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170402_011858.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170403_034139.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170403_134048.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170403_235029.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170404_095958.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170405_052402.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170405_152315.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170406_115754.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170406_215709.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170407_115510.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170407_215422.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170408_080358.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170409_041314.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170409_141231.subreads.bam.fasta.gz \
f /its1/data/2017/04/SMJX2017FW00016/CleanData/m54152_170411_043542.subreads.bam.fasta.gz
touch ${sh}.done