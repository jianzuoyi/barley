cd $(dirname $0);pwd
bwa index juicer/references/scaffolds.fasta &
./Bat_generate_site_positions.sh
./Bat_chrom.size.sh
mv Assembly_MboI.txt Assembly.chrom.sizes juicer/references
wait
qsub -cwd -S /bin/bash -V -l vf=64G,h=small1 Bat_juicer.sh
