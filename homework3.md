# Homework 3

Author: Alisha Monsibais

## Summarize Genome Assembly 

#### Accessing Data 
_Drosophila melanogaster_ genome was obtained in fasta format from the following website [flybase.org](http://flybase.org/), using this code. 

>
>`wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/fasta/dmel-all-chromosome-r6.36.fasta.gz`
>


#### File Integrity 
Verification of the file integrity was completed using the checksum program. The following code was used to verify the checksum of the file downloaded to the orginial checksum located on the website. 
>
>`wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/fasta/md5sum.txt` <br>
>`md5sum --check <(grep dmel-all-chromosome-r6.36.fasta.gz md5sum.txt)`
>

#### Calculated Summaries of the Genome 
1. Total number of nucleotides - 142573024
2. Total number of Ns - 1152978
3. Total number of sequences - 1870

The program faSize was used to access the information about the _Drosophila melanogaster_ genome. 

>
>`wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/fasta/dmel-all-chromosome-r6.36.fasta.gz`<br> 
>`faSize dmel-all-chromosome-r6.36.fasta.gz`
>

## Summarize an Annotation File

#### Accessing Data
_Drosophila melanogaster_ genome was obtained in gtf format from the following website [flybase.org](http://flybase.org/) , using this code.

>
>`wget ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/gtf/dmel-all-r6.36.gtf.gz`
>

#### File Integrity
Verification of the file integrity was completed using the checksum program. The following code was used to verify the checksum of the file downloaded to the orginial checksum located on the website.

>
>`wget -O md5sum_gtf.txt ftp://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.36_FB2020_05/gtf/md5sum.txt`<br>
>`md5sum --check <(grep dmel-all-chromosome-r6.36.fasta.gz md5sum_gtf.txt)`
>

#### Compile a Report Summarizing the Annotation 
1. Total number of features of each type, sorted from the most common to the least common 

 189268 exon <br>
 162578 CDS <br>
  46664 5UTR <br>
  33629 3UTR <br>
  30812 start_codon <br>
  30754 stop_codon <br>
  30728 mRNA <br>
  17875 gene <br>
   3047 ncRNA <br>
    485 miRNA <br>
    366 pseudogene <br>
    312 tRNA <br>
    300 snoRNA <br>
    262 pre_miRNA <br>
    115 rRNA <br>
     32 snRNA <br>

Unzipping the file was done with this code
>
>`gunzip dmel-all-chromosome-r6.36.fasta.gz`<br>
>
To review the file in a clean tabular format, the following code was used. 
>
>`column -s $'\t' -t dmel-all-r6.36.gtf | less -S`
>
A pipeline was then used to obtain the third column, features, independently from the other columns. The features were then sorted and tallied which was then further sorted from the most common to the least common features that were present in the date. Output was then put into a file entitled CompileReport1.txt
>
>`cat dmel-all-r6.36.gtf | gawk -F '\t' '{print $3}' | sort | uniq -c | sort -k1,1nr > CompileReport1.txt`
>

2. Total number of genes per chromosome arm (X, Y, 2L, 3L, 3R, 4)

		2L         3516 genes <br>
		2R         3653 genes <br>
		3L         3486 genes <br>
		3R         4225 genes <br>
		4           114 genes <br>
		X          2691 genes <br>
		Y           113 genes <br>

To obtain the genes per chromsomes arm the file was processed into a pipeline. The fields 3 and 1 were printed to the screen and only lines with "gene" were selected. Further selection was performed based on teh chromosome arm and then lines were sorted and tallied. The last 7 lines were included to remove. Output was plated in CompileReport2.txt
>
>`cat dmel-all-r6.36.gtf | gawk -F '\t' '{print $3 "\t" $1}' | grep -w gene | grep -E 'X|Y|2L|2R|3L|3R|4' | sort | uniq -c > CompileReport2.txt` 
>
For formating, the following code was used. Only the last 7 lines were selected to removed the unnessary data. Gene was then transformed into genes and columns were rearranged to make reading the data easier. Output was saved to CompileReport2formated.txt

`cat CompileReport2.txt | tail -n 7 | sed 's/gene/genes/' | gawk -F '\t' '{print $1 "\t" $2}' > CompileReport2formated.txt`




