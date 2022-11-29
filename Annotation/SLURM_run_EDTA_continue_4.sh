#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=EDTA_11-29-2022_Rifkin
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=96GB
#SBATCH --time=14-00:00
#SBATCH --output=EDTA-%A-%a.log
#SBATCH --error=EDTA_error-%A-%a.log
#SBATCH --partition=standard

module purge
module load singularity
module list

singularity exec /nfs/turbo/rsbaucom/lab/SOFTWARE/EDTA.sif EDTA.pl --genome /nfs/turbo/rsbaucom/lab/Hesperis_Dovetail/Hi-Rise_Assembly_September_2022/Hesperis_assembly.fasta --step anno --overwrite 0 --sensitive 1 --anno 1 --evaluate 1 --threads 10 