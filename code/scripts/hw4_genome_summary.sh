#!/user/bin/env bash

#Summarize Genome Assembly 

#Downloading file from the internet - chromosome file 
wget ftp://ftp.flybase.net/releases/current/dmel_r6.36/fasta/dmel-all-chromosome-r6.36.fasta.gz

#File Integrity - downloads checksum file 
wget ftp://ftp.flybase.net/releases/current/dmel_r6.36/fasta/md5sum.txt 
md5sum --check <(grep dmel-all-chromosome-r6.36.fasta.gz md5sum.txt) 

#Calculate the following for all sequences <= 100 kb and all sequences >100 kb: 

#Code

#Makes the files for specific length of the sequence
#For sequences >100 kb:
bioawk -c fastx 'length($seq) > 100000{ print ">"$name; print $seq }'  dmel-all-chromosome-r6.36.fasta.gz | gzip -c > dmelr6.gt.fa.gz

#For sequences <=100 kb:
bioawk -c fastx 'length($seq) <= 100000{ print ">"$name; print $seq }'  dmel-all-chromosome-r6.36.fasta.gz | gzip -c > dmelr6.lte.fa.gz


#Identifying Nucleotide, Ns and sequences
#For the sequence >100 kb: 
faSize dmelr6.gt.fa.gz
#For the sequence <=100 kb:
faSize dmelr6.lte.fa.gz

#Answers
#For the sequences >100 kb"
#1. Total number of nucleotides		137057575
#2. Total number of Ns 			490385
#3. Total number of sequences		7

#For the sequences <=100 kb
#1. Total number of nucleotides 	5515449
#2. Total number of Ns			662593
#3. Total number of sequences		1863


#Plots of the following for all sequences =/< 100 kb and all sequences >100 kb:

#Code

#Makes the file for Sequence name, sequence length and sequence GC(%)
#For sequence > 100 kb
bioawk -c fastx '{ print length($seq) "\t" gc($seq) }' dmelr6.gt.fa.gz | sort  -k1,1rn > dmelr6.gt.txt

#For sequences <= 100 kb:
bioawk -c fastx '{ print length($seq) "\t" gc($seq) }' dmelr6.lte.fa.gz | sort  -k1,1rn > dmelr6.lte.txt

#Answers
#Text Files were downloaded and process in an R script for the following questions:
#1. Sequence length distribution (Histogram in log scale)
#2. Sequence GC% distribution (Histogram) 

#Rscript
#Histograms for HW#4 - Bioinformatics 

#Set working directory 
setwd("C:/Users/anmon/Desktop")

#Downloads the data from the working directory 
dmelr6.lte <- read.delim("dmelr6.lte.txt", header = FALSE, col.names = c("Seq Length", "GC Percent"))
dmelr6.gt <- read.delim("dmelr6.gt.txt", header = FALSE, col.names = c("Seq Length", "GC Percent"))

#Transforming Seq Length in Log formation 
LogSL.gt <- log(dmelr6.gt$Seq.Length)
dmelr6.gt <- cbind(dmelr6.gt, LogSL.gt)
LogSL.lte <- log(dmelr6.lte$Seq.Length)
dmelr6.lte <- cbind(dmelr6.lte, LogSL.lte)


#Histograms for Sequence Length
hist(dmelr6.lte$LogSL.lte,
     main = "Distribution of Seq. Length for Seq <=100kb", 
     xlab ="Seq. Length (Log)", 
     border = "purple", 
     col = "darkred")
hist(dmelr6.gt$LogSL.gt,
     main = "Distribution of Seq. Lengthe for Seq >100kb", 
     xlab ="Seq. Length (Log)", 
     border = "blue", 
     col = "darkgreen")


#Histograms for GC Percentage
hist(dmelr6.lte$GC.Percent,
    main = "Histogram of GC Percentage for Seq <=100kb", 
    xlab ="Percent Distribution", 
    border = "purple", 
    col = "darkred")
hist(dmelr6.gt$GC.Percent,
     main = "Histogram of GC Percentage for Seq >100kb", 
     xlab ="Percent Distribution", 
     border = "blue", 
     col = "darkgreen")

#Last question was processed in the Terminal
#3. Cumulative sequence size sorted from the larges to smallest sequences
#To get the cumulative sequence size plot
#For the sequences >100 kb:
plotCDF <(cut -f 1 dmelr6.gt.txt) /dev/stdout | display 
#For the sequence <=100 kb:
plotCDF <(cut -f 1 dmelr6.lte.txt) /dev/stdout | display



