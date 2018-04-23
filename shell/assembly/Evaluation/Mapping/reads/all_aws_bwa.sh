#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804497_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804497_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804497_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804497_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804497_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804497_1.bam > /home/ec2-user/data/SRR1804497_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804497_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804497_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804497_1.map.reads.num s3://barley/maprate/SRR1804497_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804497_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804497_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804497_1.PE2Ref.is s3://barley/maprate/SRR1804497_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804498_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804498_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804498_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804498_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804498_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804498_1.bam > /home/ec2-user/data/SRR1804498_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804498_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804498_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804498_1.map.reads.num s3://barley/maprate/SRR1804498_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804498_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804498_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804498_1.PE2Ref.is s3://barley/maprate/SRR1804498_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804499_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804499_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804499_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804499_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804499_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804499_1.bam > /home/ec2-user/data/SRR1804499_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804499_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804499_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804499_1.map.reads.num s3://barley/maprate/SRR1804499_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804499_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804499_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804499_1.PE2Ref.is s3://barley/maprate/SRR1804499_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804500_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804500_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804500_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804500_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804500_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804500_1.bam > /home/ec2-user/data/SRR1804500_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804500_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804500_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804500_1.map.reads.num s3://barley/maprate/SRR1804500_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804500_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804500_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804500_1.PE2Ref.is s3://barley/maprate/SRR1804500_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804501_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804501_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804501_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804501_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804501_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804501_1.bam > /home/ec2-user/data/SRR1804501_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804501_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804501_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804501_1.map.reads.num s3://barley/maprate/SRR1804501_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804501_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804501_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804501_1.PE2Ref.is s3://barley/maprate/SRR1804501_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804502_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804502_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804502_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804502_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804502_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804502_1.bam > /home/ec2-user/data/SRR1804502_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804502_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804502_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804502_1.map.reads.num s3://barley/maprate/SRR1804502_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804502_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804502_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804502_1.PE2Ref.is s3://barley/maprate/SRR1804502_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804503_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804503_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804503_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804503_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804503_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804503_1.bam > /home/ec2-user/data/SRR1804503_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804503_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804503_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804503_1.map.reads.num s3://barley/maprate/SRR1804503_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804503_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804503_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804503_1.PE2Ref.is s3://barley/maprate/SRR1804503_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804504_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804504_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804504_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804504_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804504_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804504_1.bam > /home/ec2-user/data/SRR1804504_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804504_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804504_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804504_1.map.reads.num s3://barley/maprate/SRR1804504_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804504_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804504_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804504_1.PE2Ref.is s3://barley/maprate/SRR1804504_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804505_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804505_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804505_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804505_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804505_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804505_1.bam > /home/ec2-user/data/SRR1804505_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804505_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804505_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804505_1.map.reads.num s3://barley/maprate/SRR1804505_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804505_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804505_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804505_1.PE2Ref.is s3://barley/maprate/SRR1804505_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804506_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804506_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804506_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804506_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804506_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804506_1.bam > /home/ec2-user/data/SRR1804506_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804506_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804506_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804506_1.map.reads.num s3://barley/maprate/SRR1804506_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804506_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804506_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804506_1.PE2Ref.is s3://barley/maprate/SRR1804506_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804507_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804507_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804507_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804507_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804507_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804507_1.bam > /home/ec2-user/data/SRR1804507_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804507_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804507_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804507_1.map.reads.num s3://barley/maprate/SRR1804507_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804507_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804507_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804507_1.PE2Ref.is s3://barley/maprate/SRR1804507_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804508_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804508_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804508_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804508_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804508_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804508_1.bam > /home/ec2-user/data/SRR1804508_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804508_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804508_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804508_1.map.reads.num s3://barley/maprate/SRR1804508_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804508_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804508_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804508_1.PE2Ref.is s3://barley/maprate/SRR1804508_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804509_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804509_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804509_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804509_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804509_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804509_1.bam > /home/ec2-user/data/SRR1804509_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804509_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804509_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804509_1.map.reads.num s3://barley/maprate/SRR1804509_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804509_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804509_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804509_1.PE2Ref.is s3://barley/maprate/SRR1804509_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804510_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804510_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804510_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804510_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804510_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804510_1.bam > /home/ec2-user/data/SRR1804510_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804510_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804510_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804510_1.map.reads.num s3://barley/maprate/SRR1804510_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804510_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804510_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804510_1.PE2Ref.is s3://barley/maprate/SRR1804510_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804511_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804511_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804511_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804511_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804511_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804511_1.bam > /home/ec2-user/data/SRR1804511_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804511_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804511_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804511_1.map.reads.num s3://barley/maprate/SRR1804511_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804511_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804511_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804511_1.PE2Ref.is s3://barley/maprate/SRR1804511_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804512_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804512_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804512_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804512_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804512_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804512_1.bam > /home/ec2-user/data/SRR1804512_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804512_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804512_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804512_1.map.reads.num s3://barley/maprate/SRR1804512_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804512_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804512_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804512_1.PE2Ref.is s3://barley/maprate/SRR1804512_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804513_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804513_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804513_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804513_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804513_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804513_1.bam > /home/ec2-user/data/SRR1804513_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804513_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804513_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804513_1.map.reads.num s3://barley/maprate/SRR1804513_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804513_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804513_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804513_1.PE2Ref.is s3://barley/maprate/SRR1804513_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804514_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804514_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804514_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804514_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804514_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804514_1.bam > /home/ec2-user/data/SRR1804514_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804514_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804514_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804514_1.map.reads.num s3://barley/maprate/SRR1804514_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804514_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804514_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804514_1.PE2Ref.is s3://barley/maprate/SRR1804514_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/SRR1804515_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/SRR1804515_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/SRR1804515_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/SRR1804515_1.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/SRR1804515_1.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/SRR1804515_1.bam > /home/ec2-user/data/SRR1804515_1.F4.sam
cut -f 1 /home/ec2-user/data/SRR1804515_1.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/SRR1804515_1.map.reads.num
aws s3 cp /home/ec2-user/data/SRR1804515_1.map.reads.num s3://barley/maprate/SRR1804515_1.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view SRR1804515_1.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/SRR1804515_1.PE2Ref.is
aws s3 cp /home/ec2-user/data/SRR1804515_1.PE2Ref.is s3://barley/maprate/SRR1804515_1.PE2Ref.is
shutdown -h now
#!/bin/bash

cd /home/ec2-user/data
for i in $(seq 1 3)
do
    aws s3 cp s3://barley/data/ngs/xxx.fastq.gz.clean.dup.clean.gz.cor.pair.gz /home/ec2-user/data/xxx.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f /home/ec2-user/data/xxx.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

/home/ec2-user/biosoft/anaconda2/bin/bwa mem -t 32 -p /home/ec2-user/data/db/Hulless_barley.scaffold.fa /home/ec2-user/data/xxx.fastq.gz.clean.dup.clean.gz.cor.pair.gz | /home/ec2-user/biosoft/anaconda2/bin/samtools view -1 -@ 32 - | /home/ec2-user/biosoft/anaconda2/bin/samtools sort -@ 32 -n -o /home/ec2-user/data/xxx.bam -

/home/ec2-user/biosoft/anaconda2/bin/samtools view -F 4 /home/ec2-user/data/xxx.bam > /home/ec2-user/data/xxx.F4.sam
cut -f 1 /home/ec2-user/data/xxx.F4.sam > names
mapped_reads=$(uniq names| wc -l)
uniq_mapped_reads=$(uniq -u names | wc -l)
echo $mapped_reads $uniq_mapped_reads > /home/ec2-user/data/xxx.map.reads.num
aws s3 cp /home/ec2-user/data/xxx.map.reads.num s3://barley/maprate/xxx.map.reads.num

/home/ec2-user/biosoft/anaconda2/bin/samtools view xxx.bam | awk -v binsize=20 '{if ($5==60) {if ($9>0) {print int($9/binsize)}else{print int($9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print $2*binsize","$1}' > /home/ec2-user/data/xxx.PE2Ref.is
aws s3 cp /home/ec2-user/data/xxx.PE2Ref.is s3://barley/maprate/xxx.PE2Ref.is
shutdown -h now
