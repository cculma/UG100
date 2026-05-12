#!/bin/bash

# Define Paths
INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
FAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa.fai"
DIC="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa.dict"
PICARD="/software/el9/apps/picard/3.0.0/picard.jar"

# 1. Reference Preparation for Variant Calling
# .fai and .dict
# not generated with apptainer. Generated directly with samtools
# apptainer run alignment.sif samtools faidx $REF
# apptainer run alignment.sif samtools dict $REF -o ${REF%.fa}.dict

module load apptainer
module load gatk
module load picard

# works ok
#samtools faidx $REF
#samtools dict $REF -o ${REF%.fa}.dict
awk 'BEGIN {FS="\t"}; {print $1 FS "0" FS $2}' ${REF}.fai > ${REF}.bed
java -jar $PICARD BedToIntervalList \
    -I ${BED} \
    -O ${REF%.fa}.interval_list \
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

REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_04/haplo_01_04.fa"

samtools faidx $REF
samtools dict $REF -o ${REF%.fa}.dict

awk 'BEGIN {FS="\t"}; {print $1 FS "0" FS $2}' $fasta.fai > $fasta.bed