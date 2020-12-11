# Homework 4

Author: Alisha N. Monsibais

## Part I: Summarize partitions of a genome assembly 

### Calculate the following for all sequences <= 100kb and all sequences >100kb:

>Downloads file from the internet - file is in fasta format <br> 
>`wget ftp://ftp.flybase.net/releases/current/dmel_r6.36/fasta/dmel-all-chromosome-r6.36.fasta.gz` <br>
>Check File Integrity - downloads checksum file and check the checksum using md5sum program <br>
>`wget ftp://ftp.flybase.net/releases/current/dmel_r6.36/fasta/md5sum.txt`<br> 
>`md5sum --check <(grep dmel-all-chromosome-r6.36.fasta.gz md5sum.txt)` 
>
>The following code is for making specific lengths of sequences into two files. Bioawk is using fasta files
>line by line and pulls all the >100kb sequences (upper code) or <=100kb sequences (lower code), and outputs 
>them to a gzip file which gets labeled. 
>  
>1. For sequences >100 kb:<br>
>`bioawk -c fastx 'length($seq) > 100000{ print ">"$name; print $seq }'  dmel-all-chromosome-r6.36.fasta.gz | gzip -c > dmelr6.gt.fa.gz`
>2. For sequences <=100 kb:<br>
>`bioawk -c fastx 'length($seq) <= 100000{ print ">"$name; print $seq }'  dmel-all-chromosome-r6.36.fasta.gz | gzip -c > dmelr6.lte.fa.gz`
>
>
>Code for Identifying Nucleotide, Ns and sequences with the program faSize
>1. For the sequence >100 kb:<br> 
>`faSize dmelr6.gt.fa.gz`
>2. For the sequence <=100 kb:<br>
>`faSize dmelr6.lte.fa.gz`

### Answers
**1.  For the sequences >100 kb**

 - Total number of nucleotides		137057575
 - Total number of Ns 		490385
 - Total number of sequences		7

**2. For the sequences <=100 kb**
 
 - Total number of nucleotides	5515449
 - Total number of Ns		662593
 - Total number of sequences		1863

### Plots of the following for all sequences <=100kb and all sequences >100kb:

>This code is for making files for sequence length and sequence GC(%) of the previously analyzed files. 
>The program bioawk is using fasta format which prints the length of the sequence followed by a tab
>and then the GC% of the sequence. This is then piped into sort to sort the first column reverse 
>numeric and is put into an output file. 
>1. For sequence >100 kb: <br>
>`bioawk -c fastx '{ print length($seq) "\t" gc($seq) }' dmelr6.gt.fa.gz | sort  -k1,1rn > dmelr6.gt.txt`
>2. For sequences <=100 kb:<br>
`bioawk -c fastx '{ print length($seq) "\t" gc($seq) }' dmelr6.lte.fa.gz | sort  -k1,1rn > dmelr6.lte.txt`

_Text Files were downloaded and process in an R script:_

### Rscript

>```
>#Histograms for HW#4 - Bioinformatics 
>
>#Set working directory
>setwd("C:/Users/anmon/Desktop")
>
>#Downloads the data from the working directory 
>dmelr6.lte <- read.delim("dmelr6.lte.txt", header = FALSE, col.names = c("Seq Length", "GC Percent"))
>dmelr6.gt <- read.delim("dmelr6.gt.txt", header = FALSE, col.names = c("Seq Length", "GC Percent"))
>
>#Transforming Seq Length in Log formation 
>LogSL.gt <- log(dmelr6.gt$Seq.Length)
>dmelr6.gt <- cbind(dmelr6.gt, LogSL.gt)
>LogSL.lte <- log(dmelr6.lte$Seq.Length)
>dmelr6.lte <- cbind(dmelr6.lte, LogSL.lte)
>
>#Histograms for Sequence Length
>hist(dmelr6.lte$LogSL.lte,
>    main = "Distribution of Seq. Length for Seq <=100kb", 
>    xlab ="Seq. Length (Log)", 
>    border = "purple",
>    col = "darkred")
>hist(dmelr6.gt$LogSL.gt,
>    main = "Distribution of Seq. Lengthe for Seq >100kb", 
>    xlab ="Seq. Length (Log)",
>    border = "blue",
>    col = "darkgreen")
>
>#Histograms for GC Percentage
>hist(dmelr6.lte$GC.Percent,
>    main = "Histogram of GC Percentage for Seq <=100kb", 
>    xlab ="Percent Distribution",
>    border = "purple",
>    col = "darkred")
>hist(dmelr6.gt$GC.Percent,
>    main = "Histogram of GC Percentage for Seq >100kb", 
>    xlab ="Percent Distribution",
>    border = "blue",
>    col = "darkgreen")
>```

### Answers 

**1. Sequence length distribution (Histogram in log scale)**
![image](http://i.ibb.co/9YRLXtn/1-2.jpg)
![image](http://i.ibb.co/0XQJJRs/1-1.jpg)

**2. Sequence GC% distribution (Histogram)**
![image](https://i.ibb.co/hf5Lt08/2-2.jpg)
![image](https://i.ibb.co/xjL7vFj/2-1.jpg)

**3. Cumulative sequence size sorted from the larges to smallest sequences**

>To obtain the cumulative sequence size plot the files were cut for everything but field 1
>which was processed into standard out and piped into display to be viewed. 
>
>For the sequences >100 kb:<br>
>`plotCDF <(cut -f 1 dmelr6.gt.txt) /dev/stdout | display`

![image](https://i.ibb.co/KFG5sL0/3-1.jpg)
 
>For the sequence <=100 kb:<br>
>`plotCDF <(cut -f 1 dmelr6.lte.txt) /dev/stdout | display`

![image](https://i.ibb.co/WpqNmHJ/3-2.png)

## Part II: Genome assembly 

### Assemble a genome form MinION READS
**1. Download Reads:** 
 
>Downloads data on home directory <br> 
>`wget https://hpc.oit.uci.edu/~solarese/ee282/iso1_onp_a2_1kb.fastq.gz`<br>
>Unzip file for further downstream processing <br>
>`gunzip iso1_onp_a2_1kb.fastq.gz`<br>

**2. Use `minimap` to overlay reads**

>Program minimap Requires srun 32. This provides enough computing power to process the code. 
>Additionally, conda activate activates the necessary environment. <br>
>`srun -c 32 -A ecoevo282 --pty --x11 bash -i`<br>
>`conda activate ee282`
>
>n50 is a Bash function that calculates the n50. This function provides the size of contig at
>which 50% of the genome is present. This function uses bioawk with the input format in fasta file.
>Bioawk then parses the data and prints the length of the sequence along with the length of the
>accumulating amount of the total sequence. The END portion prints the final summed sequenced length.
>The data is then piped into the sort function which then sorts the data reverse numeric. 
>The gawk function then definds the % of genomes by length and prints the length at which 50% (or more) 
>of the genome is reached.  
>```
>n50 () {
>  bioawk -c fastx ' { print length($seq); n=n+length($seq); } END { print n; } ' $1 \
>  | sort -rn \
>  | gawk ' NR == 1 { n = $1 }; NR > 1 { ni = $1 + ni; } ni/n > 0.5 { print $1; exit; } '
>}
>```
>Establishes the place and names of directories of the project 
>```
>basedir=~/   
>projname=nanopore_assembly
>basedir=$basedir/$projname
>raw=$basedir/$projname/data/raw
>processed=$basedir/$projname/data/processed
>figures=$basedir/$projname/output/figures
>reports=$basedir/$projname/output/reports
>```
>
>Create the Project name and pulls the data from my directory and links data
>to my directory 
>`createProject $projname $basedir` <br>
>`ln -sf ~/iso1_onp_a2_1kb.fastq $raw/reads.fq`
>
>The program minimap overlaps the reads for the file reads.fq. Settings (-Sw5 -L100 -m0)
>are used to set the best conditions for processing the code. The syntax {,} is used to create a copy
>of the sequence so it can be referance against itself. The pipe then gzips the file and 
>designates out output file location and name.   
>```
>minimap -t 32 -Sw5 -L100 -m0 $raw/reads.fq{,} \
>| gzip -1 \   
> $processed/onp.paf.gz  
>```
>

  
**3. Use `miniasm` to construct an assemply**

>The program miniasm constructs the assembly by using the output from minimap, which takes the
>all-vs-all read self-mapping. The code also specifies the reads and mapping file,
>output file is a gfa (graphical fragment assembly). 
>```
>miniasm -f $raw/reads.fq $processed/onp.paf.gz \
> $processed/reads.gfa  
>```

### Assembly Assessment 
**1. Calculate the N50 of your assembly and compare it to the Drosophila community reference's contig N50**

_Continued Code from previous section_

>This awk code selects every line that starts with an S then prints the starting character (>) 
>with the name of the sequence. This is then followed by a new line
>and the sequence itself. After, the pipe and tee function splits the results
>into a the n50 function and produces a file (n50.txt) and pushes the data to the next pipe. 
>The next pipe cut the characters at 60 and folds the sequence to the next line. Finally, the code is output to 
>the processing file and is saved as uitigs.fa (in fasta format)
>
>```
>awk ' $0 ~/^S/ { print ">" $2" \n" $3 } ' $processed/reads.gfa \
>| tee >(n50 /dev/stdin > $reports/n50.txt) \ 
>| fold -w 60 \ 
>> $processed/unitigs.fa
>```
> 
>To view the N50 of my assembled sequence
> 
>```
>less $reports/n50.txt
>```
>
>To see the L50 of my assembled sequence/more information. 
>The function faSize is used, the file is then sorted by the second 
>column in reverse numeric and outputed to the screen 
>```
>faSize -detailed $processed/unitigs.fa | sort -k 2,2nr | less
>```

***Answer***
 
1. Community Reference's Information 
- N50  21,485,538
- L50  3
2.  My Assembly's Inforation 
- N50  4,494,246
- L50  8

Comparison - My assembly compared to the community assembly indicates that my assembly had smaller contig in length, thus 50% of the genome is represents by the 8 contigs that make up the N50 of the genome at sequence 4,494,246 while the Community Reference's had a Contig N50 at 21,485,538 which represents 3 contigs. 

**2. Compare your assembly to both the contig assembly and the scaffold assembly from the Drosophilia melmanogaster on FlyBase using a contiguity plot**

>Activates environment 
>```
>conda activate ee282
>```
>Create directory
>```
>createProject fifos ~/classrepos3
>```
>Copies my assembly to the fifos file 
>```
>cp unitigs.fa ~/classrepos3/fifos
>```
>Gets into the right director 
>```
>cd ~/classrepos3/fifos
>```
>Used to get the file for D. melanogaster for the contig assembly and scaffold assembly 
>```
>r6url="ftp://ftp.flybase.net/releases/current/dmel_r6.36/fasta/dmel-all-chromosome-r6.36.fasta.gz"
>```
>Makes 3 files in the tmp folder 
>```
>mkfifo tmp/{r6scaff,r6ctg,myseq}_fifo
>```
>Gets and process the fly base genome 
>```
>wget -O - -q $r6url \
>| tee >( \
>  bioawk -c fastx ' { print length($seq) } ' \
>  | sort -rn \
>  | awk ' BEGIN { print "Assembly\tLength\nFB_Scaff\t0" } { print "FB_Scaff\t" $1 } ' \
>  > tmp/r6scaff_fifo & ) \
>| faSplitByN /dev/stdin /dev/stdout 10 \
>| bioawk -c fastx ' { print length($seq) } ' \
>| sort -rn \
>| awk ' BEGIN { print "Assembly\tLength\nFB_Ctg\t0" } { print "FB_Ctg\t" $1 } ' \
>> tmp/r6ctg_fifo &
>```
>
>Gets and processes my assembly
>```
>less unitigs.fa \
>| bioawk -c fastx ' { print length($seq) } ' \
>| sort -rn \
>| awk ' BEGIN { print "Assembly\tLength\nmySeq_Ctg\t0" } { print "mySeq_Ctg\t" $1 } ' \
>> tmp/myseq_fifo &
>```
>
>Makes the plot on the same graph 
>```
>plotCDF2 tmp/{r6scaff,r6ctg,myseq}_fifo /dev/stdout \
>| tee r6_v_myseq.png \
>| display 
>```
>Removed files
>```
>rm tmp/{r6scaff,r6ctg,myseq}_fifo
>```
Contiguity plot
![image](https://i.ibb.co/VWqfTJz/contiguityplot1.png)

**3. Calculate BUSCO score of both assemblies and compare them.**
>```
>#BUSCO for code for Flybase genome assembly  
>busco -c 31 -i dmel-all-chromosome-r6.36.fasta.gz -l diptera_odb10 -o dmel_busco_flybase -m genome
>#Score |C:99.5%[S:99.1%, D:0.4],F:0.2%,M:0.3%,n:3285
>```
![image](https://i.ibb.co/QCPT2tR/busco.png)
>```
>#BUSCO code for Solarese fastq file genome assembly 
>busco -c 31 -i ~/nanopore_assembly/nanopore_assembly/data/processed/unitigs.fa \
> -l diptera_odb10 -o dmel_busco_solarese -m genome
>#Score |C:0.2%[0.2%,D:0.0%],F:2.0%,M:97.8%,n:3285
>```
![image](https://i.ibb.co/Vxs89gJ/busco-sol.png)
