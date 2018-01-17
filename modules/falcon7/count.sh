#!/bin/bash

ls -l 0-rawreads/ | grep m_ | awk '{print $9}' | while read d
do
    cd 0-rawreads/$d
    if ls m_*_done; then
        echo ${d} $(du -h) | awk '{print $2}' | grep G | sed 's/G//'
        cd /its1/GB_BT2/jianzuoyi/workspace/barley/modules/falcon7
    fi
done
