#!/bin/bash

SCRIPT=$1
LINE=$2
INSTANCE_TYPE=$3
INSTANCE_PRICE=$4
SPOT_TEMPLATE_JSON=$5

SCRIPT_DIR=$(cd $(dirname $0);pwd)

WD=$(cd $(dirname $SCRIPT);pwd)

outdir=$(mktemp -d ${WD}/encode_$INSTANCE_TYPE.XXXXXX)

split -a 4 -d -l $LINE $SCRIPT encode_$INSTANCE_TYPE_
mv encode_$INSTANCE_TYPE_???? $outdir

find $outdir -type f | while read SH
do
    UserData=$(base64 $SH | tr -d "\n")
    cp $SPOT_TEMPLATE_JSON ${SH}.json
    sed "s/USERDATA_XXXXXX/${UserData}/" ${SH}.json -i
    sed "s/INSTANCETYPE_XXXXXX/${INSTANCE_TYPE}/" ${SH}.json -i

    echo "aws ec2 request-spot-instances --spot-price $INSTANCE_PRICE --instance-count 1 --type one-time --launch-specification file://${SH}.json"
done > ${outdir}.spot.sh
