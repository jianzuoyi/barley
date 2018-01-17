WD=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Lachesis2/30.evaluation/mummer
while read fn
do
    name_lac=$(basename $fn .fa)
    while read fnref
    do
	name_ref=$(basename $fnref .fa)
	prefix=${name_ref}_VS_$name_lac
	mkdir -p ${WD}/${prefix}
	echo $fn $fnref $prefix ${WD}/${prefix} | awk '{print "cd "$4";bash /its1/GB_BT2/jianzuoyi/workspace/barley/modules/Lachesis2/30.evaluation/run_mummerplot.sh",$3,$1,$2" 16"}'
    done < reference.fofn
done < lachesis.fofn
