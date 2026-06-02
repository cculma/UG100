#!/bin/bash


# Define Paths

REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram"
CRAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram.crai"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/08_make_examples"

# run this script where the out_bed files were generated
# /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/out_bed02
# for loop to run make_examples.sif for each bed file generated from 05.1_interval_bed.sh
# option `--median-coverage <median_coverage> \` was not recognized. It is not present in this version of make_examples.sif
# GVCF: Add the arguments --gvcf and --p-error 0.005 to the make_examples step. L42

for i in *.bed
do

p=${i%%.bed}
temp=${p#interval}
result=${temp%_of*}

apptainer run ${BIND_PATH}/make_examples.sif tool \
  --input ${CRAM} \
  --cram-index ${CRAI} \
  --bed ${i} \
  --output ${OUT_DIR}/${result} \
  --reference ${REF} \
  --min-base-quality 5 \
  --min-mapq 5 \
  --cgp-min-count-snps 2 \
  --cgp-min-count-hmer-indels 2 \
  --cgp-min-count-non-hmer-indels 2 \
  --cgp-min-fraction-snps 0.12 \
  --cgp-min-fraction-hmer-indels 0.12 \
  --cgp-min-fraction-non-hmer-indels 0.06 \
  --cgp-min-mapping-quality 5 \
  --max-reads-per-region 1500 \
  --assembly-min-base-quality 0 \
  --gvcf --p-error 0.005 --gzip-output \
  --optimal-coverages 50 \
  --add-ins-size-channel

done
