#!/bin/bash

CRAM=/common/surfs/curti242/umgc/2025-q3/421685-20250723_2054/Curtin_Project_004_Pool_2/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram
GENOME=/projects/standard/curti242/shared/ASSEMBLIES/ALFALFA-ASSEMBLIES/REGENSY27x/all.haps.rename.fasta

conda activate py38

# Run DNAscope

sentieon driver -t 40 -r ${GENOME} -i ${CRAM}.sample_final.bam \
    --algo DNAscope \
    --model ultima_model.bundle \
    --var_type snp,indel \
    --emit_mode gvcf \
    ${CRAM}output_sample.g.vcf.gz


# The DNAscope pipeline uses a combination of Bayesian statistical approaches and machine learning to achieve high variant calling accuracy. The DNAscope pipeline supports samples sequenced using whole-genome or targeted (hybrid-capture) enrichment library preps.