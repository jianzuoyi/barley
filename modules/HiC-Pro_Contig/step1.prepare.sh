ASM=10.reference/contigs.fasta
anno_dir=20.annotations
mkdir -p $anno_dir

bowtie2-build $ASM $ASM &
fastalength $ASM | awk '{print $2"\t"$1}' > $anno_dir/assembly.sizes &
/its1/GB_BT2/jianzuoyi/biosoft/HiC-Pro_2.9.0/bin/utils/digest_genome.py -r ^GATC -o ./20.annotations/assembly_MboI.bed $ASM &

wait

touch $0.done
