#!/bin/bash

finished_jobs=$(find 0-rawreads/ -name 'job*done' | wc -l)
total_jobs=$(cat 0-rawreads/run_jobs.sh | grep ^# | head -1 | cut -f 2 -d '(' | cut -f 1 -d ')')

echo finished_jobs: $finished_jobs total_jobs: $total_jobs
