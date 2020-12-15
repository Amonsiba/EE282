#!/usr/bin/env bash

#Obtaining data for Final Project and puts fasta files into the data/raw directory 

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

#Prokka Program - this program produces gff files which will be the input files for Roary. 
#Prokka is a program that rapidly annotates prokaryotic genomes. 

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

#Output Directory will contain 11 files, I am only interested in the .gff file. 
#The .gff file is the master annotation of GFF3 format, containing the sequences and annotations

#Renames file for easy processing and identification of original file. 
#This was done for each of the 8 viruses, identification number of each virus is used along with .gff to indicate what file type. 
cd ~/myrepos/ee282/data/raw/prokka_GCA_002956145/ 
mv PROKKA_12112020.gff 002956145.gff 

#Makes new directory for .gff files, which all should be stored in the same location, for processing the Roary Program 
cd ~/myrepos/ee282/data/processed/ 
mkdir GFF

#Copies only relabeled gff file to GFF folder for processing of Roary File
#This was done for each of the 8 viruses individually 
cd ~/myrepos/ee282/data/raw/prokka_GCA_002956145
cp 002956145.gff ~/myfirstgitproject/data/processed/GFF/

#Confirmation that all files were copied to the GFF folder 
cd ~/myrepos/ee282/data/processed/GFF
tree

#Installing Roary
conda config --add channels r
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
conda install roary

#Intalling additional programs that are needed to generate the plots 
conda install -c anaconda numpy
conda install -c conda-forge matplotlib
conda install -c anaconda seaborn
conda install -c anaconda pandas
conda install fasttree

#Running Program Roary. 
#This line uses Roary "ry" to access and run the program . Syntax -f denotes the output directory file as steno.
#Syntax -e creates a multiFASTA alignment of core genes using PRANK (a program within the Roary Program). 
#Syntax -v verbose output to STDOUT. And lastly, Syntax -n uses fast core gene alignment with MAFFT. 
cd ~/myrepos/ee282/data/processed/
ry -f ./steno -e -n -v ./GFF/*.gff 
#This produces a directory called "steno" which contains 20 different files types. These will be used to access
#information about the 8 steno strains. The data will be used to create interesting plots that illustrate the 
#similarities or differences amoung the phage genomes.  

#To create the plots the following 3 steps were performed:
#1.) Obtaining the code for ploting
#2.) generating a tree from the Roary files which will be used in the plotting code 
#3.) Actual code for running the plots
#To create the plots from the Roary files, the follow was download with wget into the working directory.  
wget https://raw.githubusercontent.com/sanger-pathogens/Roary/master/contrib/roary_plots/roary_plots.py
# generate a tree file from the alignment generated by Roary
FastTree -nt -gtr core_gene_alignment.aln > core_gene_alignment.nwk
#Actual code that will produce Final Roary Figures
python roary_plots.py core_gene_alignment.nwk gene_presence_absence.csv

#This will produce 3 png files:
#1. Pangenome_frequency.png - this will show the frequency of genes versus the number of genomes analyzed. 
display Pangenome_frequency.png
#2. Pangenome_mixture.png - this will show the tree comparison in a matrix format with the presence and absence of core and accessory genes. 
display Pangenome_matrix.png
#3. Pangenome_pie.png - this will show a pie chart with the breakdown of genes and the number of isolate they are present in 
display Pangenome_pie.png

#Additional Graphical Analysis was completed in R with the use of the following Script:
#Roary Script - R section 
#!/usr/bin/env Rscript
# ABSTRACT: Create R plots
# PODNAME: create_plots.R
# Take the output files from the pan genome pipeline and create nice plots.
# Provided by Andrew Page (https://github.com/sanger-pathogens/Roary/blob/master/bin/create_pan_genome_plots.R)
# Rtab files were obtained from Roary output files in the steno directory
setwd("C:/Users/anmon/Desktop")
library(ggplot2)


mydata = read.table("number_of_new_genes.Rtab")
boxplot(mydata, data=mydata, main="Number of new genes",
        xlab="No. of genomes", ylab="No. of genes",varwidth=TRUE, ylim=c(0,max(mydata)), outline=FALSE)

mydata = read.table("number_of_conserved_genes.Rtab")
boxplot(mydata, data=mydata, main="Number of conserved genes",
        xlab="No. of genomes", ylab="No. of genes",varwidth=TRUE, ylim=c(0,max(mydata)), outline=FALSE)

mydata = read.table("number_of_genes_in_pan_genome.Rtab")
boxplot(mydata, data=mydata, main="No. of genes in the pan-genome",
        xlab="No. of genomes", ylab="No. of genes",varwidth=TRUE, ylim=c(0,max(mydata)), outline=FALSE)

mydata = read.table("number_of_unique_genes.Rtab")
boxplot(mydata, data=mydata, main="Number of unique genes",
        xlab="No. of genomes", ylab="No. of genes",varwidth=TRUE, ylim=c(0,max(mydata)), outline=FALSE)

mydata = read.table("blast_identity_frequency.Rtab")
plot(mydata,main="Number of blastp hits with different percentage identity",  xlab="Blast percentage identity", ylab="No. blast results")


library(ggplot2)
conserved = colMeans(read.table("number_of_conserved_genes.Rtab"))
total = colMeans(read.table("number_of_genes_in_pan_genome.Rtab"))

genes = data.frame( genes_to_genomes = c(conserved,total),
                    genomes = c(c(1:length(conserved)),c(1:length(conserved))),
                    Key = c(rep("Conserved genes",length(conserved)), rep("Total genes",length(total))) )

ggplot(data = genes, aes(x = genomes, y = genes_to_genomes, group = Key, linetype=Key)) +geom_line()+
  theme_classic() +
  ylim(c(1,max(total)))+
  xlim(c(1,length(total)))+
  xlab("No. of genomes") +
  ylab("No. of genes")+ theme_bw(base_size = 16) +  theme(legend.justification=c(0,1),legend.position=c(0,1))+
  ggsave(filename="conserved_vs_total_genes.png", scale=1)

#################################################################################################################3

unique_genes = colMeans(read.table("number_of_unique_genes.Rtab"))
new_genes = colMeans(read.table("number_of_new_genes.Rtab"))

genes = data.frame( genes_to_genomes = c(unique_genes,new_genes),
                    genomes = c(c(1:length(unique_genes)),c(1:length(unique_genes))),
                    Key = c(rep("Unique genes",length(unique_genes)), rep("New genes",length(new_genes))) )

ggplot(data = genes, aes(x = genomes, y = genes_to_genomes, group = Key, linetype=Key)) +geom_line()+
  theme_classic() +
  ylim(c(1,max(unique_genes)))+
  xlim(c(1,length(unique_genes)))+
  xlab("No. of genomes") +
  ylab("No. of genes")+ theme_bw(base_size = 16) +  theme(legend.justification=c(1,1),legend.position=c(1,1))+
  ggsave(filename="unique_vs_new_genes.png", scale=1)





