#!/bin/bash

# Define Paths
INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
FAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa.fai"
DIC="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa.dict"

# 1. Reference Preparation for Variant Calling
# .fai and .dict
# not generated with apptainer. Generated directly with samtools
# apptainer run alignment.sif samtools faidx $REF
# apptainer run alignment.sif samtools dict $REF -o ${REF%.fa}.dict

module load apptainer
module load gatk
module load picard

# works ok
apptainer run ug_gatk_picard.sif \
    picard BedToIntervalList \
    -I ${FAI} \
    -O ${OUT_DIR}/${REF%.fa}.interval_list \
    -SD ${DIC}


# 3. Ultima-Specific Filtering Files
# not tested. I cannot find the step to use them.
apptainer run alignment.sif \
    ua-tools map28 \
    --reference $REF \
    --output ${REF%.fa}.map28.vcf.gz

apptainer run alignment.sif \
    ua-tools CalculateGcContent \
    --input $REF \
    --output ${REF%.fa}.gc_profile.vcf.gz

# to locate ONNX file
# does not work
# apptainer run call_variants.sif ls -R /models/efficient_dv