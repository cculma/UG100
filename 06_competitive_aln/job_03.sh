#!/bin/bash

#SBATCH --job-name="UG01"   #name of this job
#SBATCH -p ceres              #name of the partition (queue) you are submitting to
#SBATCH -N 1                  #number of nodes in this job
#SBATCH -n 40                 #number of cores/tasks in this job, you get all 20 physical cores with 2 threads per core with hyper-threading
#SBATCH -t 1-00:00:00           #time allocated for this job hours:mins:seconds
#SBATCH --mail-user=cesar.medinaculma@ars.usda.gov   # email address
#SBATCH --mail-type=BEGIN,END,FAIL #will receive an email when job starts, ends or fails
#SBATCH -A xu_alfalfabreeding # name of the slurm account - same as the SCINet project name
#SBATCH -o "%j.out"     # standard output, %j adds job number to output file name and %N adds the node name
#SBATCH -e "%j.err"     #optional, prints our standard error

module load apptainer
module load gatk
module load picard
module load samtools

REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_04/haplo_01_04.fa"

./03_interval_bed.sh
