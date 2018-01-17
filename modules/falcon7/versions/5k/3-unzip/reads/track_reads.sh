set -vex
trap 'touch /its1/GB_BT2/jianzuoyi/workspace/barley/modules/falcon7/3-unzip/reads/track_reads_done.exit' EXIT
hostname
date
cd ../..
python -m falcon_kit.mains.get_read_ctg_map
python -m falcon_kit.mains.rr_ctg_track
python -m falcon_kit.mains.pr_ctg_track
#mkdir -p 3-unzip/reads/
python -m falcon_kit.mains.fetch_reads
cd /its1/GB_BT2/jianzuoyi/workspace/barley/modules/falcon7/3-unzip/reads
date
touch /its1/GB_BT2/jianzuoyi/workspace/barley/modules/falcon7/3-unzip/reads/track_reads_done
