#!/bin/bash

#!/bin/bash

#SBATCH --job-name="UG01"   #name of this job
#SBATCH -p ceres              #name of the partition (queue) you are submitting to
#SBATCH -N 1                  #number of nodes in this job
#SBATCH -n 80                 #number of cores/tasks in this job, you get all 20 physical cores with 2 threads per core with hyper-threading
#SBATCH -t 05:00:00           #time allocated for this job hours:mins:seconds
#SBATCH --mail-user=cesar.medinaculma@ars.usda.gov   # email address
#SBATCH --mail-type=BEGIN,END,FAIL #will receive an email when job starts, ends or fails
#SBATCH -A xu_alfalfabreeding # name of the slurm account - same as the SCINet project name
#SBATCH -o "%j.out"     # standard output, %j adds job number to output file name and %N adds the node name
#SBATCH -e "%j.err"     #optional, prints our standard error
date

module load apptainer

# Pull make examples
apptainer pull make_examples.sif docker://ultimagenomics/make_examples:latest

# Pull sorter
apptainer pull sorter.sif docker://ultimagenomics/sorter:1.5

# Pull the Variant Caller (DeepVariant)
apptainer pull call_variants.sif docker://ultimagenomics/call_variants:latest

# WGS Metrics: Custom Picard tools to measure coverage specifically in homopolymer regions (where UG data is most sensitive).
apptainer pull ug_gatk_picard.sif docker://ultimagenomics/ug_gatk_picard:latest

# Pull the Aligner and Sorter
apptainer pull alignment.sif docker://ultimagenomics/alignment:4.0

# Pull the filtering
apptainer pull ugbio_filtering.sif docker://ultimagenomics/ugbio_filtering:1.22.0


# java -jar picard.jar CollectWgsMetrics \
#        I=input.bam \
#        O=collect_wgs_metrics.txt \
#        R=reference_sequence.fasta 