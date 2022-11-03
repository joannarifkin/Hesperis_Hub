#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=EDTA_10-14-2022_Rifkin
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=36
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=96GB
#SBATCH --time=14-00:00
#SBATCH --output=EDTA-%A-%a.log
#SBATCH --error=EDTA_error-%A-%a.log
#SBATCH --partition=standard

module purge
module load singularity
module list

singularity exec /nfs/turbo/rsbaucom/lab/SOFTWARE/EDTA.sif EDTA.pl --genome /nfs/turbo/rsbaucom/lab/Hesperis_Dovetail/Hi-Rise_Assembly_September_2022/Hesperis_assembly.fasta --overwrite 0 --sensitive 1 --anno 1 --evaluate 1 --threads 10 
#
#Job summary for JobID 43813743 on the greatlakes cluster for jlrifkin
#Job name: EDTA_10-14-2022_Rifkin
#--------------------------------------------------------------------------
#Job submit time:     10/14/2022 10:11:36
#Job start time:      10/14/2022 10:11:37
#Job end time:        10/28/2022 10:11:48
#Job running time:    14-00:00:11
#
#State:               TIMEOUT
#Exit code:           0
#
#On nodes:            gl3054
#                     (1 nodes with 36 cores per node)
#
#CPU Utilized:        171-08:57:40
#CPU Efficiency:      34.00% of 504-00:06:36 total CPU time (cores * walltime)
#
#Memory Utilized:     82.04 GB
#Memory Efficiency:   85.45% of 96.00 GB
#Cost:                $181.78
--------------------------------------------------------------------------

