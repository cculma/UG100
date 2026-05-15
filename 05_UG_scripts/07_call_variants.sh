#!/bin/bash -l

#SBATCH --partition=gpu-a100
#SBATCH --qos=normal
#SBATCH --job-name=UG01
#SBATCH --account=xu_alfalfabreeding
#SBATCH --mail-user=cesar.medinaculma@ars.usda.gov
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --ntasks=48


REF="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/02_files/haplo_01_mem2/haplo_01.fa"
OUT_DIR="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/08_make_examples"
BIND_PATH="/project/xu_alfalfabreeding/system_from_home/msi/UG100/05_UG_scripts"
CRAM="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram"
CRAI="/90daydata/xu_alfalfabreeding/system_from_home/msi/UG100/06_output/output_basename-000/output_basename/output_basename.cram.crai"

# Always good practice to reset environment when you start
module purge
module load apptainer/1.1.9

# apptainer run call_variants.sif --param params.ini
srun apptainer exec --nv call_variants.sif --param params.ini
srun apptainer exec