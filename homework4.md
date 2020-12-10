# Homework 4

Author: Alisha N. Monsibais

## Part I: Summarize partitions of a genome assembly 

### Calculate the following for all sequences <= 100kb and all sequences >100kb:

>Downloading file from the internet - chromosome file in fasta format <br> 
>`wget ftp://ftp.flybase.net/releases/current/dmel_r6.36/fasta/dmel-all-chromosome-r6.36.fasta.gz` <br>
>Check File Integrity - downloads checksum file <br>
>`wget ftp://ftp.flybase.net/releases/current/dmel_r6.36/fasta/md5sum.txt`<br> 
>`md5sum --check <(grep dmel-all-chromosome-r6.36.fasta.gz md5sum.txt)` 
>
>Code for making the files for specific length of the sequence
>1. For sequences >100 kb:<br>
>`bioawk -c fastx 'length($seq) > 100000{ print ">"$name; print $seq }'  dmel-all-chromosome-r6.36.fasta.gz | gzip -c > dmelr6.gt.fa.gz`
>
>2. For sequences <=100 kb:<br>
>`bioawk -c fastx 'length($seq) <= 100000{ print ">"$name; print $seq }'  dmel-all-chromosome-r6.36.fasta.gz | gzip -c > dmelr6.lte.fa.gz`
>
>
>Code for Identifying Nucleotide, Ns and sequences
>1. For the sequence >100 kb:<br> 
>`faSize dmelr6.gt.fa.gz`
>2. For the sequence <=100 kb:<br>
>`faSize dmelr6.lte.fa.gz`

### Answers
**1.  For the sequences >100 kb**
- Total number of nucleotides		137057575
- Total number of Ns 			490385
- Total number of sequences		7

**2. For the sequences <=100 kb**
- Total number of nucleotides 	5515449
- Total number of Ns			662593
- Total number of sequences		1863

### Plots of the following for all sequences </= 100kb and all sequences >100kb:

>Code for making the file for sequence name, sequence length and sequence GC(%)
>1. For sequence > 100 kb: <br>
>`bioawk -c fastx '{ print length($seq) "\t" gc($seq) }' dmelr6.gt.fa.gz | sort  -k1,1rn > dmelr6.gt.txt`
>2. For sequences <= 100 kb:<br>
`bioawk -c fastx '{ print length($seq) "\t" gc($seq) }' dmelr6.lte.fa.gz | sort  -k1,1rn > dmelr6.lte.txt`

## Text Files were downloaded and process in an R script:

## Rscript

>`#Histograms for HW#4 - Bioinformatics` 
>
>`#Set working directory ` <br>
>`setwd("C:/Users/anmon/Desktop")`<br>
>
>`#Downloads the data from the working directory`<br> 
>`dmelr6.lte <- read.delim("dmelr6.lte.txt", header = FALSE, col.names = c("Seq Length", "GC Percent"))`<br>
>`dmelr6.gt <- read.delim("dmelr6.gt.txt", header = FALSE, col.names = c("Seq Length", "GC Percent"))`<br>
>
>`#Transforming Seq Length in Log formation `<br>
>`LogSL.gt <- log(dmelr6.gt$Seq.Length)`<br>
>`dmelr6.gt <- cbind(dmelr6.gt, LogSL.gt)`<br>
>`LogSL.lte <- log(dmelr6.lte$Seq.Length)`<br>
>`dmelr6.lte <- cbind(dmelr6.lte, LogSL.lte)`<br>
>
>`#Histograms for Sequence Length`<br>
>`hist(dmelr6.lte$LogSL.lte,`<br>
>     `main = "Distribution of Seq. Length for Seq <=100kb",`<br>
>     `xlab ="Seq. Length (Log)",`<br>
>`    `border = "purple",` <br>
>`    `col = "darkred")`<br>
>`hist(dmelr6.gt$LogSL.gt,`<br>
>`    `main = "Distribution of Seq. Lengthe for Seq >100kb",`<br> 
>`    `xlab ="Seq. Length (Log)",` <br>
>`    `border = "blue",` <br>
>`    `col = "darkgreen")`<br>
>
>`#Histograms for GC Percentage`<br>
>`hist(dmelr6.lte$GC.Percent,`<br>
>    `main = "Histogram of GC Percentage for Seq <=100kb",`<br> 
>    `xlab ="Percent Distribution",` <br>
>    `border = "purple",` <br>
>    `col = "darkred")`<br>
>`hist(dmelr6.gt$GC.Percent,`<br>
>    `main = "Histogram of GC Percentage for Seq >100kb",`<br> 
>    `xlab ="Percent Distribution",` <br>
>    `border = "blue",` <br>
>    `col = "darkgreen")`<br>


#1. Sequence length distribution (Histogram in log scale)
#2. Sequence GC% distribution (Histogram)




#Last question was processed in the Terminal
#3. Cumulative sequence size sorted from the larges to smallest sequences
#To get the cumulative sequence size plot
#For the sequences >100 kb:
plotCDF <(cut -f 1 dmelr6.gt.txt) /dev/stdout | display 
#For the sequence <=100 kb:
plotCDF <(cut -f 1 dmelr6.lte.txt) /dev/stdout | display






















## Part II: Genome assembly 

### Assemble a genome form MinION READS

### Assembly assessment 

## Extra Credit 
