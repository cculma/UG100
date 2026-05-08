#!/bin/bash

# Define Paths
INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"


# Define the ONNX path inside the container
ONNX_MODEL="/models/efficient_dv/germline/germline_model.onnx"

# Before running the calling step, verify the ONNX file exists in your specific version of the container by running:
apptainer exec call_variants.sif ls -R /models/efficient_dv

apptainer run --nv call_variants.sif \
    /opt/deepvariant/bin/run_deepvariant \
    --model_type=ULTIMA_WGS \
    --ref=$REF \
    --reads=$OUT_DIR/output_basename.bam \
    --output_vcf=$OUT_DIR/sample.vcf.gz \
    --output_gvcf=$OUT_DIR/sample.g.vcf.gz \
    --num_shards=32 \
    --make_gvcf=true \
    --onnx_model=$ONNX_MODEL \
    --intervals=${REF%.fa}.interval_list