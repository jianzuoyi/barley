#!/bin/bash

# aws instance
c4_xlarge_cpu=4
c4_xlarge_price=0.3185
c4_2xlarge_cpu=8
c4_2xlarge_price=0.6371
c4_4xlarge_cpu=16
c4_4xlarge_price=1.2742

INSTANCE_TYPE=c4.2xlarge
INSTANCE_CPU=$c4_2xlarge_cpu
INSTANCE_PRICE=$c4_2xlarge_price
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

for i in \$(seq 1 3)
do
    aws s3 cp ${S3_data}/${sn}.fastq.gz.clean.dup.clean.gz.cor.pair.gz $EC2_data/${sn}.fastq.gz.clean.dup.clean.gz.cor.pair.gz
    if [[ -f $EC2_data/${sn}.fastq.gz.clean.dup.clean.gz.cor.pair.gz ]];then
	break
    fi
done

$BWA mem -t $INSTANCE_CPU -p $DB $EC2_data/${sn}.fastq.gz.clean.dup.clean.gz.cor.pair.gz > $EC2_data/${sn}.sam && \\
mapped_reads=\$($SAMTOOLS view -F 4 $EC2_data/${sn}.sam | cut -f 1 | sort | uniq | wc -l)
uniq_mapped_reads=\$($SAMTOOLS view -F 4 $EC2_data/${sn}.sam | cut -f 1 | sort | uniq -u | wc -l)
echo \$mapped_reads \$uniq_mapped_reads > ${EC2_data}/${sn}.map.reads.num
aws s3 cp ${EC2_data}/${sn}.map.reads.num $S3_maprate

$MOSDEPTH -t $INSTANCE_CPU ${EC2_data}/${sn}.mosdepth $EC2_data/${sn}.sam && \\
aws s3 cp ${EC2_data}/${sn}.mosdepth* $S3_maprate
#shutdown -h now"
done < sample_name > all_aws_bwa.sh

bash aws-encode.sh all_aws_bwa.sh 19 $INSTANCE_TYPE $INSTANCE_PRICE spot_template.json

# The End
