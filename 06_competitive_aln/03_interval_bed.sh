#!/bin/bash

# Define Paths
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_04/haplo_01_04.fa"
INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
PICARD="/software/el9/apps/picard/3.0.0/picard.jar"

# 1. Reference Preparation for Variant Calling
# cd /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_04/

samtools faidx $REF
samtools dict $REF -o ${REF%.fa}.dict
awk 'BEGIN {FS="\t"}; {print $1 FS "0" FS $2}' ${REF}.fai > ${REF%.fa}.bed

# works ok
java -jar $PICARD BedToIntervalList \
    -I ${REF%.fa}.bed \
    -O ${REF%.fa}.interval_list \
    -SD ${REF%.fa}.dict
# /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2

mkdir out02 && \
java -jar $PICARD IntervalListTools \
  SCATTER_COUNT=40 \
  SUBDIVISION_MODE=BALANCING_WITHOUT_INTERVAL_SUBDIVISION_WITH_OVERFLOW \
  UNIQUE=true \
  SORT=true \
  BREAK_BANDS_AT_MULTIPLES_OF=10000000 \
  INPUT=${REF%.fa}.interval_list \
  OUTPUT=out02

mkdir out_bed02
# mk dir to put all interval.bed files (40 files)
# run for loop to created 40 bed files from 40 scattered.interval_list files

cd out02

for i in *
do
j="${i#*_}"
cd ${i}
cat scattered.interval_list | grep -v @ | awk 'BEGIN{OFS="\t"}{print $1,$2-1,$3}' > ../../out_bed02/interval${j}.bed
cd ../
done

# this will create 40 bed files to run the script 06_make.sh