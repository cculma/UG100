#!/bin/bash -l

#SBATCH --partition=gpu
#SBATCH --qos=normal
#SBATCH --job-name=UG01
#SBATCH --account=xu_alfalfabreeding
#SBATCH --mail-user=cesar.medinaculma@ars.usda.gov
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --ntasks=48

 # Always good practice to reset environment when you start
 module purge

