#!/bin/bash

REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
PICARD="/software/el9/apps/picard/3.0.0/picard.jar"

# run where is located haplo_01.interval_list
# /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2

mkdir out02 && \
java -jar $PICARD IntervalListTools \
  SCATTER_COUNT=40 \
  SUBDIVISION_MODE=BALANCING_WITHOUT_INTERVAL_SUBDIVISION_WITH_OVERFLOW \
  UNIQUE=true \
  SORT=true \
  BREAK_BANDS_AT_MULTIPLES_OF=10000000 \
  INPUT=haplo_01.interval_list \
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