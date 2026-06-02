#!/bin/bash -l

#SBATCH --job-name="UG01"   #name of this job
#SBATCH --partition=gpu-a100
#SBATCH --qos=normal
#SBATCH --account=xu_alfalfabreeding
#SBATCH --mail-user=cesar.medinaculma@ars.usda.gov
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --gres=gpu:1
#SBATCH -o "%j.out"
#SBATCH -e "%j.err"

# Always good practice to reset environment when you start
module purge
module load apptainer/1.4.3

# apptainer run call_variants.sif --param params.ini
# run from /90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_make_examples
# params.ini is also located in this direcotry

BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"

apptainer run --nv ${BIND_PATH}/call_variants.sif call_variants --param params.ini
