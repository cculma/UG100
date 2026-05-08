#!/bin/bash

# Define Paths
INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"


# 1. Reference Preparation for Variant Calling
# .fai and .dict
apptainer run alignment.sif samtools faidx $REF
apptainer run alignment.sif samtools dict $REF -o ${REF%.fa}.dict

# 2. Interval List
# This creates a Picard-style interval list of the entire genome
apptainer run alignment.sif \
    gatk BedToIntervalList \
    -I ${REF}.fai \
    -O ${OUT_DIR}/reference.interval_list \
    -SD ${REF%.fa}.dict

# 3. Ultima-Specific Filtering Files
apptainer run alignment.sif \
    ua-tools map28 \
    --reference $REF \
    --output ${REF%.fa}.map28.vcf.gz

apptainer run alignment.sif \
    ua-tools CalculateGcContent \
    --input $REF \
    --output ${REF%.fa}.gc_profile.vcf.gz

# to locate ONNX file
apptainer exec call_variants.sif ls -R /models/efficient_dv