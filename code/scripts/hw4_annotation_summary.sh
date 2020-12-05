#!/usr/bin/env bash

#Genome Assembly 

#Assemble a genome from MinION reads 

#1. Download reads 

#2. Use minimap to overlap reads

#3. Use miniasm to construct an assembly 



#Assembly assessment 
#1. Calculate the N50 of your asssemply and compare it to the Drosophilia community reference's contig N50


##This code is for the whole sequence. Nee to seperate n>100kb n<=100kb
#Made file that contains length of sequences, and gc content
bioawk -c fastx '{ print length($seq) "\t" gc($seq) }' dmel-all-chromosome-r6.36.fasta.gz | sort  -k1,1rn > dmelr6.all.txt
#Makes code to print the sequence length, then the accumulated amount, then the precent of the total genome
gawk '{t = t + $1; print $1 "\t" t "\t" t/143726002}' dmelr6.all.txt | column -t | less


#2. Compare your assembly to both the contig assembly and the saffold assembly from the Drosophilia melmanogaster on FlyBase using a contiguity plot

#3. Calculate BUSCO score of both assemblies and compare them. 

#EC. Compare your assembly to the contig assembly from Drosophila melanogaster on FlyBase using a dotplot constructed with MUMmer 
