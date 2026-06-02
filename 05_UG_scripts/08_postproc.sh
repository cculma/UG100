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
#  --infile call_variants.1.gz,call_variants.2.gz,call_variants.3.gz,call_variants.4.gz,call_variants.5.gz,call_variants.6.gz,call_variants.7.gz,call_variants.8.gz,call_variants.9.gz,call_variants.10.gz,call_variants.11.gz,call_variants.12.gz,call_variants.13.gz,call_variants.14.gz,call_variants.15.gz,call_variants.16.gz,call_variants.17.gz,call_variants.18.gz,call_variants.19.gz,call_variants.20.gz,call_variants.21.gz,call_variants.22.gz,call_variants.23.gz,call_variants.24.gz,call_variants.25.gz,call_variants.26.gz,call_variants.27.gz,call_variants.28.gz,call_variants.29.gz,call_variants.30.gz,call_variants.31.gz,call_variants.32.gz,call_variants.33.gz,call_variants.34.gz,call_variants.35.gz,call_variants.36.gz,call_variants.37.gz,call_variants.38.gz,call_variants.39.gz,call_variants.40.gz \
#  --nonvariant_site_tfrecord_path 0001.gvcf.tfrecord.gz,0002.gvcf.tfrecord.gz,0003.gvcf.tfrecord.gz,0004.gvcf.tfrecord.gz,0005.gvcf.tfrecord.gz,0006.gvcf.tfrecord.gz,0007.gvcf.tfrecord.gz,0008.gvcf.tfrecord.gz,0009.gvcf.tfrecord.gz,0010.gvcf.tfrecord.gz,0011.gvcf.tfrecord.gz,0012.gvcf.tfrecord.gz,0013.gvcf.tfrecord.gz,0014.gvcf.tfrecord.gz,0015.gvcf.tfrecord.gz,0016.gvcf.tfrecord.gz,0017.gvcf.tfrecord.gz,0018.gvcf.tfrecord.gz,0019.gvcf.tfrecord.gz,0020.gvcf.tfrecord.gz,0021.gvcf.tfrecord.gz,0022.gvcf.tfrecord.gz,0023.gvcf.tfrecord.gz,0024.gvcf.tfrecord.gz,0025.gvcf.tfrecord.gz,0026.gvcf.tfrecord.gz,0027.gvcf.tfrecord.gz,0028.gvcf.tfrecord.gz,0029.gvcf.tfrecord.gz,0030.gvcf.tfrecord.gz, 0031.gvcf.tfrecord.gz,0032.gvcf.tfrecord.gz,0033.gvcf.tfrecord.gz,0034.gvcf.tfrecord.gz,0035.gvcf.tfrecord.gz,0036.gvcf.tfrecord.gz,0037.gvcf.tfrecord.gz,0038.gvcf.tfrecord.gz,0039.gvcf.tfrecord.gz,0040.gvcf.tfrecord.gz
