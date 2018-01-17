#!/bin/bash

corrected_total_bases=$(cat run_pilon.sh.o185298 | grep Confirmed | awk '{sum+=$2}END{print sum}')
finish_number=$(grep Confirmed run_pilon.sh.o185298 -c)
echo corrected total bases: $corrected_total_bases / 5,555,465,980
echo finish number: $finish_number / 192
