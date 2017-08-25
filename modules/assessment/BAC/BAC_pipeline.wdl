workflow BAC_pipeline {
  String assembly
  String BAC
  String threads
  call blastn {
    input:
      assembly=assembly,
		  BAC=BAC,
		  threads=threads
  }
  call getscaffold {
    input:
      assembly=assembly,
      blastout=blastn.out
  }
  call nucmer {
    input:
      BAC=BAC,
		  scaffold=getscaffold.scaffold,
		  threads=threads
  }
  call mummerplot {
    input:
      reference=getscaffold.scaffold,
		  query = BAC,
	    delta=nucmer.mapped
  }
}

task blastn {
  String blastn
  String assembly
  String BAC
  String threads
  command {
    ${blastn} -query ${BAC} -db ${assembly} -outfmt 6 -out blastn.m6 -max_target_seqs 1 -max_hsps 1 -num_threads ${threads}
  }
  output {
    File out="blastn.m6"
  }
}

task getscaffold {
  String assembly
  String filterbyname
  String blastout
  command {
    set -vex
    scaffold=$(cut -f 2 ${blastout})
    ${filterbyname} in=${assembly} out="scaffold.fa" names="$scaffold" include=t
  }
  output {
    File scaffold="scaffold.fa"
  }
}

task nucmer {
  String nucmer
  String delta_filter
  String scaffold
  String BAC
  String threads
  command {
    ${nucmer} -p mapped -t ${threads} ${scaffold} ${BAC}
    ${delta_filter} -rqg mapped.delta > filter.delta
  }
  output {
    File mapped="filter.delta"
  }
}

task mummerplot {
  String mummerplot
  String gnuplot_dir
  String gnuplot_bin
  String delta
  String reference
  String query
  command {
    export PATH=${gnuplot_dir}:${gnuplot_bin}:$PATH
    ${mummerplot} ${delta} -p ${delta} -R ${reference} -Q ${query} --postscript
  }
  output {
    File ps = "${delta}.ps"
  }
}
