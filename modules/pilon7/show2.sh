#!/bin/bash

corrected_total_bases=$(cat run_pilon.sh.5330.qsub/pilon_0002.sh.o185308 | grep Confirmed | awk '{sum+=$2}END{print sum}')
finish_number=$(grep Confirmed run_pilon.sh.5330.qsub/pilon_0002.sh.o185308 -c)
echo corrected total bases: $corrected_total_bases / 5,555,465,980
echo finish number: $finish_number / 847
