#!/bin/bash

# Pull the Aligner and Sorter
apptainer pull alignment.sif docker://ultimagenomics/alignment:latest

# Pull the Variant Caller (DeepVariant)
apptainer pull call_variants.sif docker://ultimagenomics/call_variants:latest

# WGS Metrics: Custom Picard tools to measure coverage specifically in homopolymer regions (where UG data is most sensitive).
apptainer pull ug_gatk_picard.sif docker://ultimagenomics/ug_gatk_picard:latest

apptainer pull ugbio_filtering.sif docker://ultimagenomics/ugbio_filtering:latest

# java -jar picard.jar CollectWgsMetrics \
#        I=input.bam \
#        O=collect_wgs_metrics.txt \
#        R=reference_sequence.fasta 