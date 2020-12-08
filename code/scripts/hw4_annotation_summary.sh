#!/usr/bin/env bash

#Genome Assembly 

#Assemble a genome from MinION reads 

#1. Download reads 
#downloads data on ~/ directory 
wget https://hpc.oit.uci.edu/~solarese/ee282/iso1_onp_a2_1kb.fastq.gz
#unzip file for processing 
gunzip iso1_onp_a2_1kb.fastg.gz

#Required srun that is needed in order to have enough computing power to process code
srun -c 32 -A ecoevo282 --pty --x11 bash -i

conda activate ee282
# This is a bash function. It works very similarly to a bash script.
# The arguments are stored in $1, $2, $3, etc.
n50 () {
  bioawk -c fastx ' { print length($seq); n=n+length($seq); } END { print n; } ' $1 \
  | sort -rn \
  | gawk ' NR == 1 { n = $1 }; NR > 1 { ni = $1 + ni; } ni/n > 0.5 { print $1; exit; } '
}
#This function uses bioawk, -c fastx notifies the program the input file is in fasta format. 
#Explain n50 from wiki


#Establishes the place and  names of directories of the project 
basedir=~/   
projname=nanopore_assembly
basedir=$basedir/$projname
raw=$basedir/$projname/data/raw
processed=$basedir/$projname/data/processed
figures=$basedir/$projname/output/figures
reports=$basedir/$projname/output/reports

#Create the Project name and pulls the data from my directory
createProject $projname $basedir
ln -sf ~/iso1_onp_a2_1kb.fastq $raw/reads.fq

#2. Use minimap to overlap reads 
minimap -t 32 -Sw5 -L100 -m0 $raw/reads.fq{,} \
| gzip -1 \
> $processed/onp.paf.gz

#3. Use miniasm to construct an assemply
miniasm -f $raw/reads.fq $processed/onp.paf.gz \
> $processed/reads.gfa

awk ' $0 ~/^S/ { print ">" $2" \n" $3 } ' $processed/reads.gfa \
| tee >(n50 /dev/stdin > $reports/n50.txt) \
| fold -w 60 \
> $processed/unitigs.fa
#Output file is unitigs.fa which is in fasta file and cut into 60 characters

#2. Compare your assembly to both the contig assembly and the saffold assembly from the Drosophilia melmanogaster on FlyBase using a contiguity plot

#3. Calculate BUSCO score of both assemblies and compare them. 

#EC. Compare your assembly to the contig assembly from Drosophila melanogaster on FlyBase using a dotplot constructed with MUMmer







###Random Code
#Assembly assessment
#1. Calculate the N50 of your asssemply and compare it to the Drosophilia community reference's contig N50
#Code for sequence n>100kb
gawk '{tot=tot+$1; print $1 "\t" tot} END {print tot}' dmelr6.gt.txt | sort -k1,1rn | gawk 'NR==1 {tot=$1} NR>1 && $2/tot >= 0.5 {print $0 "\t" $2/tot}' | column -t | head -1
#Code for sequence n<=100kb

gawk '{tot=tot+$1; print $1 "\t" tot} END {print tot}' dmelr6.lte.txt | sort -k1,1rn | gawk 'NR==1 {tot=$1} NR>1 && $2/tot >= 0.5 {print $0 "\t" $2/tot}' | column -t | head -1

##This code is for the whole sequence. Nee to seperate n>100kb n<=100kb
#Made file that contains length of sequences, and gc content
bioawk -c fastx '{ print length($seq) "\t" gc($seq) }' dmel-all-chromosome-r6.36.fasta.gz | sort  -k1,1rn > dmelr6.all.txt
#Makes code to print the sequence length, then the accumulated amount, then the precent of the total genome
gawk '{t = t + $1; print $1 "\t" t "\t" t/143726002}' dmelr6.all.txt | column -t | less
 
