#!/bin/bash

# Define Paths
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram"
CRAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram.crai"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_make_examples"
FAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"




REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_04/haplo_01_04.fa"
BED_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_04/out_bed02"
BED_ANNO="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_04/haplo_01_04.bed"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
PICARD="/software/el9/apps/picard/3.0.0/picard.jar"
CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/07_output/output_basename-000/output_basename/output_basename.cram"
CRAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/07_output/output_basename-000/output_basename/output_basename.cram.crai"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/07_make_examples"

# Create the .txt list files `called_records.txt` and` gvcf_records.txt`

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
  --nonvariant_site_tfrecord_path @gvcf_records.txt

#  --vcf_stats_report \
#  --use_multiallelic_model \

ug_postproc \
  --infile call_variants.1.gz,call_variants.2.gz,... \
  --ref Homo_sapiens_assembly38.fasta \
  --outfile output_prefix.vcf.gz \
  --consider_strand_bias \
  --flow_order TGCA \

  
  --qual_filter 1 \
  --filter \
  --filters_file filters.txt \
  --dbsnp Homo_sapiens_assembly38.dbsnp138.vcf



