#!/bin/bash

# Define Paths

REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_04/haplo_01_04.fa"
BED_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_04/out_bed02"
BED_ANNO="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_04/haplo_01_04.bed"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/07_make_examples"

# Create the .txt list files `called_records.txt` and` gvcf_records.txt`
# run into /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/07_make_examples

called_records=($(ls call_variants.*.gz | sort -V)) \
printf "%s\n" "${called_records[@]}" > called_records.txt \

called_gvcf=($(ls *.gvcf.tfrecord.gz | sort -V)) \
printf "%s\n" "${called_gvcf[@]}" > gvcf_records.txt \

apptainer run ${BIND_PATH}/make_examples.sif ug_postproc \
  --ref ${REF} \
  --infile @called_records.txt \
  --flow_order TGCA \
  --outfile haplo_01_04.vcf.gz \
  --gvcf_outfile haplo_01_04.g.vcf.gz \
  --annotate \
  --bed_annotation_files ${BED_ANNO} \
  --consider_strand_bias \
  --qual_filter 1 \
  --nonvariant_site_tfrecord_path @gvcf_records.txt \
  --vcf_stats_report \

#  --use_multiallelic_model \


