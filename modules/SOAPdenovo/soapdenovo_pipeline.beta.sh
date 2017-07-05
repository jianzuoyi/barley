#!/bin/bash
set -vex

# Usage: $soapdenovo_pipeline config kmers
source $1

pregraph_jobs=1-run_pregraph_jobs.sh
contig_jobs=2-run_contig_jobs.sh
echo -e "#!/bin/bash\nset -vex\n" > $pregraph_jobs
echo -e "#!/bin/bash\nset -vex\n" > $contig_jobs
chmod +x $pregraph_jobs
chmod +x $contig_jobs

SOAPdenovo=${SOAPDENOVO63MER}
#for kmer in 31 45 63 83 93
while read kmer
do
    if [[ $kmer -gt 63 ]]; then
	SOAPdenovo=${SOAPDENOVO127MER}
    fi
    shdir=${WORKDIR}/kmer${kmer}
    mkdir -p $shdir
    prefix=${OUTDIR}/kmer${kmer}/barley
    # STEP 1 pregraph
    sh=${shdir}/1-soapdenovo_pregraph.sh
    echo -e "#!/bin/bash\nset -vex" > $sh
    chmod +x $sh
    echo "
mkdir -p ${OUTDIR}/kmer${kmer}
rm -rf ${prefix}*
cd ${shdir}
$SOAPdenovo sparse_pregraph \\
-s $LIB \\
-o $prefix \\
-K $kmer \\
-z 4480000000 \\
-p $THREADS
touch ${sh}.done" >> $sh
    echo "yhrun -p MEM_6TB -c ${THREADS} -n 1 -N 1 -e $sh.e -o $sh.o $sh &" >> $pregraph_jobs

    # STEP 2 contig
    sh=${shdir}/2-soapdenovo_contig.sh
    echo -e "#!/bin/bash\nset -vex" > $sh
    chmod +x $sh
    echo "
cd $shdir
$SOAPdenovo contig \\
-g $prefix \\
-M 1 \\
-p $THREADS
touch ${sh}.done" >> $sh
    echo "yhrun -p MEM_6TB -c ${THREADS} -n 1 -N 1 -e $sh.e -o $sh.o $sh &" >> $contig_jobs
done < $2

# Add wait for batch jobs
echo "wait" >> $pregraph_jobs
echo "wait" >> $contig_jobs

# submit
echo "yhbatch -p MEM_6TB -N 1 $pregraph_jobs" > ${pregraph_jobs}.sbatch
echo "yhbatch -p MEM_6TB -N 1 $contig_jobs" > ${contig_jobs}.sbatch
