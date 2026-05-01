#!/bin/bash
#SBATCH --cpus-per-task=32
#SBATCH --mem=128G

# Paths
REF="/data/reference/hg38.fa"
INDEX="/data/reference/hg38.fa.uai"
INPUT_CRAM="/data/input/sample.cram"
OUT_DIR="/data/output"
SAMPLE_NAME="Sample01"

# 1. Extract Read Group (RG) info from the source CRAM
# Many Ultima tools require the @RG line to exist in the BAM for sorting.
RG_HEADER=$(apptainer exec alignment.sif samtools view -H $INPUT_CRAM | grep '^@RG' | head -n 1)

# 2. Alignment via Pipe
# We use samtools to stream the CRAM as FASTQ and pipe it directly into ua align.
# Note: The -T '*' flag in samtools fastq preserves Ultima-specific flow tags (tp, t0, etc.)
echo "Running UA Alignment..."
apptainer exec -B /path/to/data:/data alignment.sif \
    bash -c "samtools fastq -T '*' $INPUT_CRAM | \
    ua align --index $INDEX \
    -R '$RG_HEADER' \
    --tp reference \
    --nthread $SLURM_CPUS_PER_TASK \
    - > $OUT_DIR/aligned_unsorted.bam"

# 3. Demux (Crucial step often missed)
# The 'demux' tool prepares the BAM for the sorter. 
# Use --channel-id=0 to prevent the 'fail to scan' error you encountered.
echo "Running Demux..."
apptainer exec -B /path/to/data:/data alignment.sif \
    ua-tools demux \
    --input $OUT_DIR/aligned_unsorted.bam \
    --output-dir $OUT_DIR/demux_out \
    --channel-id 0 \
    --nthreads $SLURM_CPUS_PER_TASK

# 4. Sorter
# The sorter now reads the demuxed chunks and produces the final CRAM.
echo "Running Sorter..."
apptainer exec -B /path/to/data:/data alignment.sif \
    sorter \
    --input-dir $OUT_DIR/demux_out \
    --output-dir $OUT_DIR/final \
    --runid $SAMPLE_NAME \
    --mark-duplicates \
    --nthreads $SLURM_CPUS_PER_TASK