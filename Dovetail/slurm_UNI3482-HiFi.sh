#!/bin/bash

#“#SBATCH” directives that convey submission options:

#SBATCH --job-name=Hesperis_dovetail_download
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=1000m 
#SBATCH --time=01-02:00:00
#SBATCH --partition=standard
#SBATCH --output=Hesperis_download_07-28-2022.log



wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/delivery/Hesperis_matronalis.p_ctg.fa?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=9TXkzJ0aq16b7UmyXSANyNDbtQY%3D&Expires=1660932240' -O Hesperis_matronalis.p_ctg.fa
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/delivery/UNI3482_report.html?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=UWYE%2FezzA2E0HmFnc1OVR091ArM%3D&Expires=1660932241' -O UNI3482_report.html
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/delivery/filtered.asm.cns.fa?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=QoLMwXScfmjSG6b23UQLqfEEAZc%3D&Expires=1660932241' -O filtered.asm.cns.fa
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/delivery/hap.fa?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=Ko82AYyalyZ3bguxOaxd6adFcRU%3D&Expires=1660932242' -O hap.fa
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/delivery/purged.fa?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=js%2BgcGgoq7vrh2%2Flktf0vxzsBiU%3D&Expires=1660932242' -O purged.fa
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/fastqs/XDOVE_20220503_S64018_PL100247539-1_B01.ccs.fastq.gz?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=LnHU8N5zxgEGOsKmjaqErHf%2BuhU%3D&Expires=1660932243' -O XDOVE_20220503_S64018_PL100247539-1_B01.ccs.fastq.gz
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/fastqs/XDOVE_20220503_S64018_PL100247539-1_C01.ccs.fastq.gz?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=7gKUFOXlR7EBmBS4JXsaLFTudm8%3D&Expires=1660932243' -O XDOVE_20220503_S64018_PL100247539-1_C01.ccs.fastq.gz
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/fastqs/XDOVE_20220503_S64018_PL100247539-1_D01.ccs.fastq.gz?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=kir9Piv%2BC72jBuGN7T0ZWNhrNJU%3D&Expires=1660932244' -O XDOVE_20220503_S64018_PL100247539-1_D01.ccs.fastq.gz
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/fastqs/XDOVE_20220523_S64049_PL100247539-2_D01.ccs.fastq.gz?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=azJ4rCm3IHj2LJUmNIPObcnkAoE%3D&Expires=1660932244' -O XDOVE_20220523_S64049_PL100247539-2_D01.ccs.fastq.gz
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/fastqs/XDOVE_20220523_S64411e_PL100247539-2_A01.ccs.fastq.gz?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=%2FOLaP3zGisY5Kx3WpRGjqJAM9lY%3D&Expires=1660932245' -O XDOVE_20220523_S64411e_PL100247539-2_A01.ccs.fastq.gz
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/fastqs/XDOVE_20220523_S64411e_PL100247539-2_B01.ccs.fastq.gz?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=NmDIdEx7%2FefiQZz2IoIR7Eqr1jc%3D&Expires=1660932245' -O XDOVE_20220523_S64411e_PL100247539-2_B01.ccs.fastq.gz
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/fastqs/XDOVE_20220523_S64411e_PL100247539-2_C01.ccs.fastq.gz?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=Xota4IkProm8bVR5ccLIFVt4dyA%3D&Expires=1660932246' -O XDOVE_20220523_S64411e_PL100247539-2_C01.ccs.fastq.gz
wget 'https://dovebucket.s3.amazonaws.com/projects/UNI3482_Hesperis_matronalis/hifiasm-draft-assembly/hifiasm/fastqs/XDOVE_20220523_S64411e_PL100247539-2_D01.ccs.fastq.gz?AWSAccessKeyId=AKIARPAV7S2IIPRQWTZE&Signature=qnAkWflN7eyD6WcerMLLCKfnUqI%3D&Expires=1660932246' -O XDOVE_20220523_S64411e_PL100247539-2_D01.ccs.fastq.gz
