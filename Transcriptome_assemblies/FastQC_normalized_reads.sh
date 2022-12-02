#!/bin/bash


#SBATCH --account=rsbaucom0
#SBATCH --job-name=FastQC_Rifkin
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=10GB 
#SBATCH --time=60:00
#SBATCH --partition=standard
#SBATCH --output=FastQC-%A-%a.log
#SBATCH --array=1-40

module purge
module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load fastqc/0.11.9-p6ckgle
module list

mkdir -p ./FastQC/
file=$(ls ./*.fq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
fastqc -o ./FastQC/ $file
