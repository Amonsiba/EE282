#!/usr/bin/env bash

#Download file
wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/gtf/dmel-all-r6.36.gtf.gz


#File Integrity 
wget -O md5sum_gtf.txt ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/gtf/md5sum.txt
md5sum --check <(grep dmel-all-r6.36.gtf.gz md5sum_gtf.txt)

#Compile a Report Summarizing the Annotation 

#1. Total number of features of each type, sorted from the most common to the least common

#2. Total number of genes per chromosome arm (X,Y,2L,2R,3L,3R,4) 

