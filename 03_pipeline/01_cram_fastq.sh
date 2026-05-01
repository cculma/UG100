#!/bin/bash

CRAM=/common/surfs/curti242/umgc/2025-q3/421685-20250723_2054/Curtin_Project_004_Pool_2/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram
GENOME=/projects/standard/curti242/shared/ASSEMBLIES/ALFALFA-ASSEMBLIES/REGENSY27x/all.haps.rename.fasta

bwa index ${GENOME}

# We use -cn to preserve Ultima-specific tags and -p for interleaved reads
samtools fastq -cn -p ${CRAM} | \
bwa mem -p -t 80 -K 100000000 ${GENOME} - | \
samtools view -1 - > ${CRAM}.aligned_raw.bam

# bwa-mem2 mem -p -t 80 -K 100000000 ${GENOME} - | \