#!/usr/bin/env bash

#Obtaining data for Final Project and puts files into the data/raw directory 

wget -P ~/myrepos/ee282/data/raw/ https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/002/956/145/GCA_002956145.1_ASM295614v1/GCA_002956145.1_ASM295614v1_genomic.fna.gz
wget -P ~/myrepos/ee282/data/raw/ https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/002/606/605/GCA_002606605.1_ASM260660v1/GCA_002606605.1_ASM260660v1_genomic.fna.gz
wget -P ~/myrepos/ee282/data/raw/ https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/008/215/605/GCA_008215605.1_ASM821560v1/GCA_008215605.1_ASM821560v1_genomic.fna.gz
wget -P ~/myrepos/ee282/data/raw/ https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/008/215/305/GCA_008215305.1_ASM821530v1/GCA_008215305.1_ASM821530v1_genomic.fna.gz
wget -P ~/myrepos/ee282/data/raw/ https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/917/355/GCA_000917355.1_ViralProj240053/GCA_000917355.1_ViralProj240053_genomic.fna.gz
wget -P ~/myrepos/ee282/data/raw/ https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/903/135/GCA_000903135.1_ViralProj179429/GCA_000903135.1_ViralProj179429_genomic.fna.gz
wget -P ~/myrepos/ee282/data/raw/ https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/009/388/225/GCA_009388225.1_ASM938822v1/GCA_009388225.1_ASM938822v1_genomic.fna.gz
wget -P ~/myrepos/ee282/data/raw/ https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/009/388/065/GCA_009388065.1_ASM938806v1/GCA_009388065.1_ASM938806v1_genomic.fna.gz

#To unzip all files for processing  
gunzip GCA_*.gz 

#Roary Section 
#Section 1: Prokka - Input files for Roary need to be processed into gff files which can be accomplished with the use of Prokka. Prokka is a program that rapidly annotates prokaryotic genomes. 

#Install Prokka
conda install -c conda-forge -c bioconda -c defaults prokka

#Annotating Prokka inputs need to be defined: kingdom: Viruses, outdir: output directory name, genus: genus of virus, locustag: the input file in fasta format 
#prokka --kingdom --outdir --genus --locustag  

prokka --kingdom Viruses --outdir prokka_GCA_002956145 --genus Delepquintavirus --locustag GCA_002956145 GCA_002956145.1_ASM295614v1_genomic.fna
prokka --kingdom Viruses --outdir prokka_GCA_002606605 --genus Ackermannviridae --locustag GCA_002606605 GCA_002606605.1_ASM260660v1_genomic.fna
prokka --kingdom Viruses --outdir prokka_GCA_008215605 --genus Pradovirus --locustag GCA_008215605 GCA_008215605.1_ASM821560v1_genomic.fna
prokka --kingdom Viruses --outdir prokka_GCA_008215305 --genus Podoviridae --locustag GCA_008215305.1_ASM821530v1/GCA_008215305.1_ASM821530v1_genomic.fna
prokka --kingdom Viruses --outdir prokka_GCA_000917355 --genus Simpcentumvirus --locustag GCA_000917355 GCA_000917355.1_ViralProj240053_genomic.fna
prokka --kingdom Viruses --outdir prokka_GCA_000903135 --genus Teseptimavirus --locustag GCA_000903135 GCA_000903135.1_ViralProj179429_genomic.fna
prokka --kingdom Viruses --outdir prokka_GCA_009388225 --genus Ackermannviridae --locustag GCA_009388225 GCA_009388225.1_ASM938822v1_genomic.fna
prokka --kingdom Viruses --outdir prokka_GCA_009388065 --genus Ackermannviridae --locustag GCA_009388065 GCA_009388065.1_ASM938806v1_genomic.fna

#Output Directory will contain 11 files, I am only interested in the .gff file. The .gff file is teh master annotation of GFF3 format, containing the sequences and annotations

#Renames file for easy processing and identification of original file. 
#This was done for each of the 8 viruses
cd ~/myrepos/ee282/data/raw/prokka_GCA_002956145/ 
mv PROKKA_12112020.gff 002956145.gff 

#Makes new directory for .gff files, which all should be stored in the same location 
cd ~/myrepos/ee282/data/processed/ 
mkdir gff

#copies only relabeled gff file to GFF folder for processing of Roary File 
cp 002956145.gff ~/myfirstgitproject/data/processed/GFF/





#ClustalOmega 
