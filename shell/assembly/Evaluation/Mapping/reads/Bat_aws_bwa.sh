#!/bin/bash

# aws instance
c4_xlarge_cpu=4
c4_xlarge_price=0.3185
c4_2xlarge_cpu=8
c4_2xlarge_price=0.6371
c4_4xlarge_cpu=16
c4_4xlarge_price=1.2742
c4_8xlarge_cpu=32
c4_8xlarge_price=2.5483

INSTANCE_TYPE=c4.8xlarge
INSTANCE_CPU=$c4_8xlarge_cpu
INSTANCE_PRICE=$c4_8xlarge_price
###############################################################

BWA=/home/ec2-user/biosoft/anaconda2/bin/bwa
SAMTOOLS=/home/ec2-user/biosoft/anaconda2/bin/samtools
MOSDEPTH=/home/ec2-user/biosoft/anaconda2/bin/mosdepth

S3_data=s3://barley/data/ngs
S3_maprate=s3://barley/maprate
EC2_data=/home/ec2-user/data
DB=/home/ec2-user/data/db/Hulless_barley.scaffold.fa

while read sn
do
    echo "#!/bin/bash

cd $EC2_data
for i in \$(seq 1 3)
do
    aws s3 cp ${S3_data}/${sn}.fastq.gz.clean.dup.clean.gz.cor.pair.gz $EC2_data/${sn}.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f $EC2_data/${sn}.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

$BWA mem -t $INSTANCE_CPU -p $DB $EC2_data/${sn}.fastq.gz.clean.dup.clean.gz.cor.pair.gz \
| $SAMTOOLS view -1 -@ $INSTANCE_CPU - | $SAMTOOLS sort -@ $INSTANCE_CPU -n -o $EC2_data/${sn}.bam -

$SAMTOOLS view -F 4 $EC2_data/${sn}.bam > ${EC2_data}/${sn}.F4.sam
cut -f 1 ${EC2_data}/${sn}.F4.sam > names
mapped_reads=\$(uniq names| wc -l)
uniq_mapped_reads=\$(uniq -u names | wc -l)
echo \$mapped_reads \$uniq_mapped_reads > ${EC2_data}/${sn}.map.reads.num
aws s3 cp ${EC2_data}/${sn}.map.reads.num ${S3_maprate}/${sn}.map.reads.num

$SAMTOOLS view ${sn}.bam | awk -v binsize=20 '{if (\$5==60) {if (\$9>0) {print int(\$9/binsize)}else{print int(\$9/binsize*-1)}}}' | sort -n | uniq -c | awk -v binsize=20 '{print \$2*binsize\",\"\$1}' > $EC2_data/${sn}.PE2Ref.is
aws s3 cp $EC2_data/${sn}.PE2Ref.is ${S3_maprate}/${sn}.PE2Ref.is
shutdown -h now"
done < sample_name > all_aws_bwa.sh

bash aws-encode.sh all_aws_bwa.sh 23 $INSTANCE_TYPE $INSTANCE_PRICE spot_template.json

# The End
