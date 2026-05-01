#!/bin/bash
#SBATCH --job-name=UG100_Pipeline
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --partition=gpu  # DeepVariant is much faster on a GPU node
#SBATCH --gres=gpu:1     # Request 1 GPU

# Define Paths
REF="/path/to/reference.fasta"
INPUT_CRAM="/path/to/sample.cram"
OUT_DIR="/path/to/output"
BIND_PATH="/path/to/project_data:/data" # Mount your project dir to /data inside container

# Step 1: Indexing
# UA indexing is slow and creates a ~50GB .uai file
apptainer exec -B $BIND_PATH alignment.sif \
    ua build --ref $REF --index $REF.uai

# Step 2: Alignment (UA Aligner)
# Note: --tp reference ensures flow-tags are correctly oriented
apptainer exec -B $BIND_PATH alignment.sif \
    ua align --index $REF.uai \
    --input $INPUT_CRAM \
    --output $OUT_DIR/aligned_raw.bam \
    --tp reference --nthread $SLURM_CPUS_PER_TASK

# Step 3: Sorting & Duplicate Marking
# The 'sorter' tool is a high-performance replacement for samtools sort/markdup
apptainer exec -B $BIND_PATH alignment.sif \
    sorter --input-file $OUT_DIR/aligned_raw.bam \
    --output-dir $OUT_DIR/sorted \
    --sample-name Sample1 \
    --mark-duplicates \
    --nthreads $SLURM_CPUS_PER_TASK

# Generate Ultima-specific QC metrics
apptainer exec -B $BIND_PATH alignment.sif \
    ua-tools statistics \
    --input /data/sorted/Sample1.bam \
    --output /data/qc/sample1_flow_stats.csv


# Step 4: Variant Calling (DeepVariant ULTIMA_WGS)
# We use --nv to enable GPU acceleration in Apptainer
apptainer exec --nv -B $BIND_PATH call_variants.sif \
    /opt/deepvariant/bin/run_deepvariant \
    --model_type=ULTIMA_WGS \
    --ref=$REF \
    --reads=$OUT_DIR/sorted/Sample1.bam \
    --output_vcf=$OUT_DIR/sample.vcf.gz \
    --output_gvcf=$OUT_DIR/sample.g.vcf.gz \
    --num_shards=$SLURM_CPUS_PER_TASK \
    --make_gvcf=true