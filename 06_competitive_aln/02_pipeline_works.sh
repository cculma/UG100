#!/bin/bash

# Define Paths

INPUT_CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram"
REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_04/haplo_01_04.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/07_output"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
PICARD="/software/el9/apps/picard/3.0.0/picard.jar"

# Step 1: Indexing
# UA indexing is slow and creates a ~50GB .uai file
apptainer run ${BIND_PATH}/alignment.sif ua --build=true --ref $REF --index $REF.uai

apptainer run ${BIND_PATH}/alignment.sif ua --build --ref $REF --index  $REF.uai --progress

# Step 2 : Align with UA
# When working with a single input BAM/CRAM file
samtools view -h -@ 32 $INPUT_CRAM -T $REF -F 2048 | \
apptainer run ${BIND_PATH}/alignment.sif ua \
    --index $REF.uai \
    --align true \
    --progress \
    --tp reference \
    --stat=$OUT_DIR/output_basename.%s.json \
    --nthread max \
    --sam-input - \
    --sam-output - \
    --seed-score-ratio 0.5 --vector --soft-clipping | \
samtools view -@ 32 -o $OUT_DIR/output_basename.bam -

java -jar $PICARD CollectWgsMetrics \
  I=$OUT_DIR/output_basename.bam \
  O=collect_wgs_metrics.txt \
  R=${REF}

# Step 3 : Sort UA Aligned BAM with Demux and Sorter
# The 'demux' tool prepares the BAM for the sorter. 
# Use --channel-id=0 to prevent the 'fail to scan' error you encountered.
samtools view -h -@ 32 $OUT_DIR/output_basename.bam | \
apptainer run ${BIND_PATH}/sorter.sif demux \
    --input=- \
    --output-dir=$OUT_DIR/ \
    --runid=output_basename \
    --nthreads 32 \
    --progress \
    --reference ${REF} \
    --mark-duplicates=true \
    --output-group=output_basename \
    --output-path={outputGroup}/{outputGroup} \
    --align=true \
    --progress \
    --cram-ignore-md5 \
    --channel-id 0

# Step 3.1: Sorter Command
apptainer run ${BIND_PATH}/sorter.sif sorter \
    --runid=output_basename \
    --input-dir=$OUT_DIR/ \
    --output-dir=$OUT_DIR/ \
    --nthreads 32 \
    --progress \
    --timestamp=000  # Used to override sorter output timestamp
