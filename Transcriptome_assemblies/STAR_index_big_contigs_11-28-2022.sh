#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=STAR_index_Rifkin_Hesperis
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=16GB 
#SBATCH --time=100:00
#SBATCH --partition=standard
#SBATCH --output=STAR_index-%A-%a.log

module purge
module use /nfs/turbo/rsbaucom/lab/Lmod #To use the GL version, replace these lines. To use a local version you add to your path, omit them.
module load STAR_module
module list


STAR --runThreadN 12 \
--runMode genomeGenerate \
--genomeDir /nfs/turbo/rsbaucom/lab/Hesperis_Dovetail/Hi-Rise_Assembly_September_2022/ \
--genomeFastaFiles /nfs/turbo/rsbaucom/lab/Hesperis_Dovetail/Hi-Rise_Assembly_September_2022/Hesperis_assembly_big_contigs.fasta \
--genomeSAindexNbases 13