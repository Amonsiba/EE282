#!/usr/bin/env bash

#Download file 
wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/fasta/dmel-all-chromosome-r6.36.fasta.gz

#File Integrity 
wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/fasta/md5sum.txt
md5sum --check <(grep dmel-all-chromosome-r6.36.fasta.gz md5sum.txt)

#Calculate Summaries of the Genome 
#1. Total nuber of nucleotides - 142573024
#2. Total number of Ns - 1152978
#3. Total number of sequences - 1870

wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/fasta/dmel-all-chromosome-r6.36.fasta.gz
faSize dmel-all-chromosome-r6.36.fasta.gz

