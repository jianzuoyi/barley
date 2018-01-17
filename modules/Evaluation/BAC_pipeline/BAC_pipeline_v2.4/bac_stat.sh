#!/usr/bin/bash
if [ $# -lt 1 ]
then 
    echo "Usage: sh bac_stat.sh <bac_add_gap.lst> >out.bac.stat"
    exit;
fi

msort='/share/raid1/self-software/bin/msort';#SZ msort
if [ ! -s $msort ]
then
    msort='/opt/blc/self-software/bin/msort';#HK msor;#HK msor
fi

BAC=$1;
$msort -k 'm5,n7,n8' $BAC | awk 'BEGIN{OFS="\t";print"#bac/fosmid_id\tlength\tcoverage_ratio\tinconsistent\tscaffold_num\tscaffold_length\tgap_num\tgap_len\tgap_ratio"}(n){if(n==$5){f++;b+=$9-$16-1;sl+=$2;gn+=$13;gl+=$14;if(e>$7-2){e=(e>$8)?e:$8;}else{l+=e-s+1;s=$7;e=$8}}else{l+=e-s+1;print n,bl,int(l/bl*10000+0.5)/100,b+f-1,f,sl,gn,gl,int(gl/sl*10000+0.5)/100;n=$5;bl=$6;f=1;b=$9-$16-1;sl=$2;gn=$13;gl=$14;s=$7;e=$8;l=0;}}(!n){n=$5;bl=$6;f=1;b=$9-$16-1;sl=$2;gn=$13;gl=$14;s=$7;e=$8;l=0;}END{l+=e-s+1;print n,bl,int(l/bl*10000+0.5)/100,b+f-1,f,sl,gn,gl,int(gl/sl*10000+0.5)/100}'
