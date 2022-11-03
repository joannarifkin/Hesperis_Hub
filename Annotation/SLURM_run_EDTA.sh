#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=EDTA_9-29-2022_Rifkin
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=36
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=48GB
#SBATCH --time=14-00:00
#SBATCH --output=EDTA-%A-%a.log
#SBATCH --error=EDTA_error-%A-%a.log
#SBATCH --partition=standard

module purge
module load singularity
module list

singularity exec /nfs/turbo/rsbaucom/lab/SOFTWARE/EDTA.sif EDTA.pl --genome /nfs/turbo/rsbaucom/lab/Hesperis_Dovetail/Hi-Rise_Assembly_September_2022/Hesperis_assembly.fasta --overwrite 1 --sensitive 1 --anno 1 --evaluate 1 --threads 10 
#
#Job summary for JobID 43014814 on the greatlakes cluster for jlrifkin
#Job name: EDTA_9-29-2022_Rifkin
#--------------------------------------------------------------------------
#Job submit time:     09/29/2022 17:51:25
#Job start time:      09/29/2022 17:51:26
#Job end time:        10/13/2022 17:51:31
#Job running time:    14-00:00:05
#
#State:               TIMEOUT
#Exit code:           0
#
#On nodes:            gl3366
#                     (1 nodes with 36 cores per node)
#
#CPU Utilized:        36-07:18:43
#CPU Efficiency:      7.20% of 504-00:03:00 total CPU time (cores * walltime)
#
#Memory Utilized:     47.87 GB
#Memory Efficiency:   99.74% of 48.00 GB
#Cost:                $181.78
--------------------------------------------------------------------------
