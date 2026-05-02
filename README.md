# UG100 S18-NGX

The objective of this project is to generate a genomic VCF (gVCF) for the genotype S18-NGX, which is derived from RegenSY27x. This genotype was used to generate Pho2 mutants. The goal is to identify the sequences (alleles) of the Pho2 region located on Chromosome 2 (2.1, 2.2, 2.3, and 2.4).

UG100 present challenges regarding homopolymers and a rigorous quality control is necessary at every step of the pipeline.

## progress 2026-05-01

1.1 Preliminary analysis. A preliminary review of the UMNGC report was conducted.

| ID | Sample           | Mean_Read | Mean_Q | Q30_FLOWS | Q40_SNVQ | total_bases   | total_reads | reads_billion |
|----|------------------|-----------|--------|-----------|----------|---------------|-------------|---------------|
| 1  | S12-PALOUSE      | 302.3     | 31.3   | 82.2      | 93.5     | 275818187432  | 912306934   | 0.91          |
| 2  | S13-VENDRE       | 301.1     | 31.5   | 82.9      | 93.8     | 286951842713  | 953034450   | 0.95          |
| 3  | S14-GIZA         | 300.1     | 31.5   | 82.7      | 93.7     | 299560687609  | 998146554   | 1.00          |
| 4  | S15-Misija       | 301.3     | 31.4   | 82.6      | 93.7     | 278773652091  | 925398267   | 0.93          |
| 5  | S16-ILLsev       | 300.3     | 31.4   | 82.5      | 93.6     | 238739357777  | 794933321   | 0.79          |
| 6  | S17-G2510        | 299.7     | 31.5   | 82.9      | 93.8     | 320724651816  | 1070245726  | 1.07          |
| 7  | S18-NGX          | 297.8     | 31.2   | 81.9      | 93.5     | 297354215135  | 998463718   | 1.00          |
| 8  | S19-Mini         | 297.8     | 31.5   | 83.2      | 94.0     | 295261567061  | 991572358   | 0.99          |
| 9  | S20-drb2abcdT0   | 300.7     | 31.4   | 82.6      | 93.7     | 276955428077  | 921022796   | 0.92          |
| 10 | S21-drb2abcdT1-6 | 301.2     | 31.3   | 82.4      | 93.7     | 312721036047  | 1038199685  | 1.04          |
| 11 | S22-drb2abcdT1-5 | 299.6     | 31.3   | 82.5      | 93.7     | 269818615860  | 900525488   | 0.90          |
|    | Mean/Total       | 300.2     | 31.4   | 82.6      | 93.7     | 3152679241618 | 10503849297 | 10.50         |
|    | Official_output* | 300       |        | >85%      | >85%     |               |             | 10-12**       |

\* Official output was obtained from <https://genomics.umn.edu/service/ug-100-sequencing> \
** Wafer contains 11 samples

Sample S18-NGX will be aligned to the RegenSY27x genome. This genome is phased and contains 32 linkage groups (LG), representing eight chromosomes across four monoploid genomes. Given a genome size of 653 Mb for Hap_01, the coverage is $455\times$. For the full phased genome (32 LG) of 2.59 Gb, the coverage is $114\times$.

| chrom                        | Chrom | Hap_1     | Hap_2     | Hap_3     | Hap_4      |
|------------------------------|-------|-----------|-----------|-----------|------------|
| medsa.RegenSY27x.gnm1.Chr1.1 | 1     | 85129743  | 87534413  | 86698797  | 81593309   |
| medsa.RegenSY27x.gnm1.Chr2.1 | 2     | 69581426  | 69606329  | 75653446  | 72621877   |
| medsa.RegenSY27x.gnm1.Chr3.1 | 3     | 96190425  | 90827970  | 91408138  | 83189900   |
| medsa.RegenSY27x.gnm1.Chr4.1 | 4     | 83716887  | 83291558  | 86231604  | 92808212   |
| medsa.RegenSY27x.gnm1.Chr5.1 | 5     | 79699470  | 62554310  | 75148351  | 71615600   |
| medsa.RegenSY27x.gnm1.Chr6.1 | 6     | 83742631  | 73507436  | 69463442  | 82998842   |
| medsa.RegenSY27x.gnm1.Chr7.1 | 7     | 79053817  | 87713645  | 88635038  | 96423042   |
| medsa.RegenSY27x.gnm1.Chr8.1 | 8     | 76300915  | 70660710  | 74845475  | 86071966   |
| Sub-Total                    |       | 653415314 | 625696371 | 648084291 | 667322748  |
| Total                        |       |           |           |           | 2594518724 |

### Two approaches will be tested

1. Alignment to Hap_1 only.

2. Alignment to the full genome (all 32 LGs).

Prior to genome indexing, 2,902 scaffolds (totaling 691,555,158 bp) will be removed. The monoploid version of the genome was generated using `samtools`:

`samtools faidx all.haps.rename.fasta` \
`medsa.RegenSY27x.gnm1.Chr1.1` \
`medsa.RegenSY27x.gnm1.Chr2.1` \
`medsa.RegenSY27x.gnm1.Chr3.1` \
`medsa.RegenSY27x.gnm1.Chr4.1` \
`medsa.RegenSY27x.gnm1.Chr5.1` \
`medsa.RegenSY27x.gnm1.Chr6.1` \
`medsa.RegenSY27x.gnm1.Chr7.1` \
`medsa.RegenSY27x.gnm1.Chr8.1` \
`> haplo_01.fa`

### Data Locations (MSI)

[//]: # (`CRAM=/common/surfs/curti242/umgc/2025-q3/421685-20250723_2054/Curtin_Project_004_Pool_2/421685-S18-NGX-Z0018-CATGCGTCCTGTGAT.cram`
`GENOME=/projects/standard/curti242/shared/ASSEMBLIES/ALFALFA-ASSEMBLIES/REGENSY27x/all.haps.rename.fasta`)

The files were downloaded from MSI and uploaded to SCinet Ceres:

[//]: # (`/projects/xu_alfalfabreeding/system_from_home/msi/UG100/` and the new files will be generated in `/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/`)

### Pipeline

The genotype S18-NGX was sequenced using the UG100 platform. The analysis pipeline follows these steps:

1. CRAM to BAM conversion (Reference-oriented Alignment Map to Binary Alignment Map).
2. Alignment to the reference genome.
3. Duplicate marking
4. Varaint calling: Ultima-specific DeepVariant or Sentieon software
5. Output GVCF

Although standard software like `samtools` or `bwa` can be used, the best choice is to use the official Ultima Genomics (UG) repositories. These include the Ultima Aligner (UA) and flow-optimized DeepVariant models, which are specifically tuned for Ultima flow-based chemistry and are not available in standard toolkits.

The UG Docker registry contains several repositories <https://hub.docker.com/u/ultimagenomics> and the project follows these specific workflows:

* <https://github.com/Ultimagen/healthomics-workflows/blob/main/workflows/trim_align_sort/howto-custom-reference-genome.md>
* <https://github.com/Ultimagen/healthomics-workflows/blob/main/workflows/trim_align_sort/howto-ua-align-sort.md>

Progress: The reference genome was indexed successfully. Steps 1.1 (UA indexing), 1.2 (UA build) and 2 (UA aligment) were run succefully.

Task for the next week: I need to solve a problem with GPU hardware compatibility. GPU will be required in the step 4 (Varaint calling with DeepVariant). Ceres cluster does not have GPUs, but Atlas does it. Therefore, all data generated on Ceres must be synchronized to Atlas via Globus. Furthermore, the Apptainer images from <https://hub.docker.com/u/ultimagenomics> are not functioning correctly on the Atlas cluster; I will write to SCinet to solve it.
