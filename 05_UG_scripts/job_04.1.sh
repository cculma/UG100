#!/bin/bash

#SBATCH --job-name="UG01"   #name of this job
#SBATCH -p ceres              #name of the partition (queue) you are submitting to
#SBATCH -N 1                  #number of nodes in this job
#SBATCH -n 80                 #number of cores/tasks in this job, you get all 20 physical cores with 2 threads per core with hyper-threading
#SBATCH -t 5-00:00:00           #time allocated for this job hours:mins:seconds
#SBATCH --mem=128G
#SBATCH --mail-user=cesar.medinaculma@ars.usda.gov   # email address
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -A xu_alfalfabreeding # name of the slurm account - same as the SCINet project name
#SBATCH -o "%j.out"     # standard output, %j adds job number to output file name and %N adds the node name
#SBATCH -e "%j.err"     #optional, prints our standard error
date                          #optional, prints out timestamp at the start of the job in stdout file

module load apptainer
module load samtools
module load java
module load gatk
module load picard

./04.1_bam_metrics.sh