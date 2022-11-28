#!/bin/bash


#SBATCH --account=rsbaucom0
#SBATCH --job-name=Trim_galore_floral_Rifkin
#SBATCH --mail-user=#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=4GB 
#SBATCH --time=200:00
#SBATCH --partition=standard
#SBATCH --output=Trim_galore_Hesperis_floral-%A-%a.log
#SBATCH --array=1-10

module purge
module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load trimgalore
module list

mkdir -p ./Trim_galore_floral/

file=$(ls /nfs/turbo/rsbaucom/lab/Hesperis/floral/*R1.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
basefile=${file%_R1.fastq.gz}
samplename=$(basename "$file" _R1.fastq.gz)


echo $file
echo $basefile
echo $samplename

trim_galore --fastqc --paired --output_dir Trim_galore_floral --cores 4 $basefile\_R1.fastq.gz $basefile\_R2.fastq.gz

#Retrim the one sample that didn't finish in time 

#trim_galore --fastqc --paired --output_dir Trim_galore_floral --cores 4 /nfs/turbo/rsbaucom/lab/Hesperis/floral/HI.4510.007.Index_25.8-Pu_R1.fastq.gz /nfs/turbo/rsbaucom/lab/Hesperis/floral/HI.4510.007.Index_25.8-Pu_R2.fastq.gz &
