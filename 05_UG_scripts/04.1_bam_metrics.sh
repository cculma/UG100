#!/bin/bash

INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
BAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename.bam"
PICARD="/software/el9/apps/picard/3.0.0/picard.jar"

# script located in 
# /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output
java -jar $PICARD CollectWgsMetrics \
  I=${BAM} \
  O=collect_wgs_metrics.txt \
  R=${REF}

# The output CRAM and CRAI are in 
# /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename