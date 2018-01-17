soap_pipeline=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Soap/bin/SOAP_pipeline.pl
reads_list=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Soap/reads.lst
lib_list=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Soap/barley.lib.lst
reference=/its1/GB_BT2/jianzuoyi/workspace/barley/modules/Soap/Hulless_barley.CHRplus.fa

perl $soap_pipeline $reads_list $reference -liblen $lib_list -verb
