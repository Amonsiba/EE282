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

#1. Sequence length distribution (Histogram in log scale)


#2. Sequence GC% distribution (Histogram) 



#3. Cumulative sequence size sorted from the larges to smallest sequences
#To get the cumulative sequence size plot
#For the sequences >100 kb:
plotCDF <(cut -f 1 dmelr6.gt.txt) /dev/stdout | display 
#For the sequence <=100 kb:
plotCDF <(cut -f 1 dmelr6.lte.txt) /dev/stdout | display


