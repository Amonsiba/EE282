# Final Project

Author: Alisha Monsibais

## Methods
### Data Used for Bioinformatic Project 
The following eight steno phages were downloaded from NCBI: [MG189906.1](https://www.ncbi.nlm.nih.gov/nuccore/MG189906), [KR560069.1](https://www.ncbi.nlm.nih.gov/nuccore/KR560069), [MK903280.1](https://www.ncbi.nlm.nih.gov/nuccore/MK903280), [NC_049463.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_049463.1), [NC_023588.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_023588.1), [NC_019416.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_019416.1), [NC_048802.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_048802.1), [NC_048804.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_048804.1). This data was obtained in compressed (gzip) fasta format and placed into the raw data directory for further processing. The data was unziped and processed into a general feature format (gff) with the use of Prokka Program. Prokka is a program that rapidly annotates bacterial, archaeal and viral genomes by identifying important features in the DNA sequence and labeling them with useful information [1]. General feature format is a format that produces tab deliminated fields per line and is the require input file type for the Roary program. All gff files were labeled with the steno phage identifier from NCBI and placed into a GFF directory (Figure 1). 

<p align="center">
![gff](https://i.ibb.co/68DDJV6/gff.png) <br>
**Figure 1**: All processed gff files located in GFF directory.   
</p>

### Roary Section 
All necessary programs to obtain the final Roary figures were initally downloaded (Table 1 and Table 2). The gff files that were combined into the GFF directory were then used for the program Roary. After Roary was ran, the program produced an output directory called "steno" which contained 20 different files.   

<center>
**Table 1**: Install Codes for Roary.

| Roary Program Installation |
| ------------------------ |
| conda config --add channels r |
| conda config --add channels defaults |
| conda config --add channels conda-forge |
| conda config --add channels bioconda |
| conda install roary |

**Table 2**: Install Codes for Additional Programs required.
| Additional Programs |
| --------------------------- |
| conda install -c anaconda numpy |
| conda install -c conda-forge matplotlib |
| conda install -c anaconda seaborn |
| conda install -c anaconda pandas |
| conda install fasttree |
</center>


![Roary_steno](https://i.ibb.co/597p7ST/steno.png) <br>
**Figure 2**: Output files obtained after completion of program Roary. 




## Results


## Discussion 



## Referency 
[1] Prokka
