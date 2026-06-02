#!/bin/bash

# Define Paths
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram"
CRAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram.crai"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_make_examples"
FAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"

apptainer run ${BIND_PATH}/make_examples.sif ug_postproc \
  --ref ${REF} \
  --infile @called_records.txt \
  --flow_order TGCA \
  --outfile output_prefix.vcf.gz \
  --gvcf_outfile output_prefix.g.vcf.gz \
  --consider_strand_bias \
  --qual_filter 1 \
  --nonvariant_site_tfrecord_path @gvcf_records.txt

#  --vcf_stats_report \
#  --use_multiallelic_model \
