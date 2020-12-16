# Final Project

Author: Alisha Monsibais

## Methods
### Data Used for Bioinformatic Project 
The following eight steno phages were downloaded from NCBI: [MG189906.1](https://www.ncbi.nlm.nih.gov/nuccore/MG189906), [KR560069.1](https://www.ncbi.nlm.nih.gov/nuccore/KR560069), [MK903280.1](https://www.ncbi.nlm.nih.gov/nuccore/MK903280), [NC_049463.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_049463.1), [NC_023588.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_023588.1), [NC_019416.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_019416.1), [NC_048802.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_048802.1), [NC_048804.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_048804.1). This data was obtained in compressed (gzip) fasta format and placed into the raw data directory for further processing. The data was unziped and processed into a general feature format (gff) with the use of Prokka Program. Prokka is a program that rapidly annotates bacterial, archaeal and viral genomes by identifying important features in the DNA sequence and labeling them with useful information [1]. General feature format is a format that produces tab deliminated fields per line and is the required input file type for the Roary program. All gff files were labeled with the steno phage identifier from NCBI and placed into a GFF directory (Figure 1). 

![gff](https://i.ibb.co/68DDJV6/gff.png) <br>
**Figure 1**: All processed gff files located in GFF directory.   

### Roary Section 
All necessary programs to obtain the final Roary figures were initally downloaded (Table 1 and Table 2). The gff files that were combined into the GFF directory were then used for the program Roary. After completion of Roary, the program produced an output directory called "steno" which contained 20 different files (Figure 2). Roary output data (gene_presence_absence.csv) was further processed to produce three figures: Pangenome frequency, Pangenome matrix, and Pangenome pie chart. This was accomplished with three steps. The first step was to obtain `roary_plots.pry` a script that produces these output figures. The second step was to use the alignment file (core_gene_alignmnet.aln) produced by Roary in the program FastTree to generate a phylogentic tree. And lastly, this was all compiled into one code: `python roary_plots.py core_gene_alignment.nwk gene_presence_absence.csv`.       

**Table 1**: Install Codes for Roary.
| Installation of Roary Program |
| ------------------------ |
| conda config --add channels r |
| conda config --add channels defaults |
| conda config --add channels conda-forge |
| conda config --add channels bioconda |
| conda install roary |

**Table 2**: Install Codes for Additional Programs required.
| Installation of Additional Programs |
| --------------------------- |
| conda install -c anaconda numpy |
| conda install -c conda-forge matplotlib |
| conda install -c anaconda seaborn |
| conda install -c anaconda pandas |
| conda install fasttree |

![Roary_steno](https://i.ibb.co/597p7ST/steno.png) <br>
**Figure 2**: Output files obtained after completion of program Roary. 

### R Script for Data Analysis
Additionally, after completion of the Roary program, R files were also obtained and downloaded. The R files were processed with the used of an [R script](https://github.com/sanger-pathogens/Roary/blob/master/bin/create_pan_genome_plots.R) provided by Andrew Page [2]. 

## Results
Overall, the results demonstrate that the eight steno phages are unique and distinct from one another based on genetic analysis. Pangenome Frequency was assessed and plotted on a graph that contained the number of genes on y axis against the genomes evaluated on the x axis. Blue bars indicate the amount of genes found in a single genome. The steno phages that were analyzed only contained three genomes which had a gene frequency greater than zero (Figure 3). The Pangenome Matrix, or the Roary matrix, assessed if the phages were distinctly different from one another regarding the presence and absence of core and accessory genes. The navy blue indicates the present of similarities while the light blue represented the absence of similarities. The total amount of genes in the analysis was 795 which encompassed all eight genomes. Furthermore, the matrix also demonstrates that the eight phage genomes varied in size (Figure 4). The Pangenome Pie chart is a breakdown of the different type of gene which includes core gene, softcore genes, shell genes, and cloud genes. No core or soft-core genes were present in the eight evaluated steno phages. However, there were 213 shell genes noted which includes genes present in 2 or more strains. Cloud genes included 582, which only were found in a single strain (Figure 5). Conserved versus Total Genes were also assessed across all eight steno phages. The total number of genes which was represented by a dotted line almost reached 800 genes, while only 3 strains contained conserved genes which was represented by a black line (Figure 6). 

![Pangenome-frequency](https://i.ibb.co/DLYnXNy/pangenome-frequency.png) <br>
**Figure 3**: Pangenome Frequency. Frequency of genes versus the number of genomes analyzed.

![Pangenome-martix](https://i.ibb.co/MgGn3BB/pangenome-matrix.png) <br>
**Figure 4**: Pangenome Matrix. Tree comparison in a matrix format that illustrate the presence and absence of core and accessory genes.

![Pangenome-pie](https://i.ibb.co/8dQDn3G/pangenome-pie.png) <br>
**Figure 5**: Pangenome Pie. A pie chart of the breakdown of genes and the number of isolate they are present in. 

![R](https://i.ibb.co/WVzqgxx/Conserved-vs-Total-Genes.png) <br>
**Figure 6**: Conserved vs Total Genes. 

## Discussion 



## Referency 
[1] Prokka
[2] R script andrew page 
