#!/bin/bash

CRAM=/common/surfs/curti242/umgc/2025-q3/421685-20250723_2054/Curtin_Project_004_Pool_2/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram
GENOME=/projects/standard/curti242/shared/ASSEMBLIES/ALFALFA-ASSEMBLIES/REGENSY27x/all.haps.rename.fasta

# Sort the raw alignment
samtools sort -@ 8 -o ${CRAM}.aligned_sorted.bam ${CRAM}.aligned_raw.bam

# Mark duplicates (using samtools)
# PCR duplicates before the variant caller can make sense of the read depth.
samtools markdup -@ 8 ${CRAM}.aligned_sorted.bam ${CRAM}.sample_final.bam

# Index the final BAM (Required for DNAscope)
samtools index  ${CRAM}.sample_final.bam