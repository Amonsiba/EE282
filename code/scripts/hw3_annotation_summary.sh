#!/usr/bin/env bash

#Download file
wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/gtf/dmel-all-r6.36.gtf.gz


#File Integrity 
wget -O md5sum_gtf.txt ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/gtf/md5sum.txt
md5sum --check <(grep dmel-all-r6.36.gtf.gz md5sum_gtf.txt)

#Compile a Report Summarizing the Annotation 

#Unzipping the data
gunzip dmel-all-r6.36.gtf.gz
#Viewing the Data
column -s $'\t' -t dmel-all-r6.36.gtf | less -S

#1. Total number of features of each type, sorted from the most common to the least common
cat dmel-all-r6.36.gtf | gawk -F '\t' '{print $3}' | sort | uniq -c | sort -k1,1nr > CompileReport1.txt


#2. Total number of genes per chromosome arm (X,Y,2L,2R,3L,3R,4) 
cat dmel-all-r6.36.gtf | gawk -F '\t' '{print $3 "\t" $1}' | grep -w gene | grep -E 'X|Y|2L|2R|3L|3R|4' | sort | uniq -c > CompileReport2.txt

#Formating the Data
cat CompileReport2.txt | tail -n 7 | sed 's/gene/genes/' | gawk -F '\t' '{print $1 "\t" $2}' > CompileReport2formated.txt
