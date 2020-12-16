# Final Project

Author: Alisha Monsibais

## Methods
### Data Used for Bioinformatic Project 
The following eight steno phages were downloaded from NCBI: [MG189906.1](https://www.ncbi.nlm.nih.gov/nuccore/MG189906), [KR560069.1](https://www.ncbi.nlm.nih.gov/nuccore/KR560069), [MK903280.1](https://www.ncbi.nlm.nih.gov/nuccore/MK903280), [NC_049463.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_049463.1), [NC_023588.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_023588.1), [NC_019416.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_019416.1), [NC_048802.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_048802.1), [NC_048804.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_048804.1), and family/genus information was organized (Table 1). This data was obtained in compressed (gzip) fasta format and placed into the raw data directory for further processing. The data was unzipped and processed into a general feature format (gff) with the use of Prokka Program. Prokka is a program that rapidly annotates bacterial, archaeal, and viral genomes by identifying important features in the DNA sequence and labeling them with useful information [1]. General feature format is a format that produces tab-delimited fields per line and is the required input file type for the Roary program [2]. All gff files were labeled with the steno phage identifier from NCBI and placed into a GFF directory (Figure 1). 

![gff](https://i.ibb.co/68DDJV6/gff.png) <br>
**Figure 1**: All processed gff files located in GFF directory.   

**Table 1**: NCBI Identifiers and Family/Genus Information 
| NCBI Identifier | Family/Geneus Information |
| --------------- | ------------------------- |
| 000903135       | Teseptimavirus          |
| 000917355       | Simpcentumvirus         |
| 002606605       | Unclassified Ackermannviridae |
| 002956145       | Delepquintavirus         |
| 008215305       | Podoviridae              |
| 008215605       | Unclassified Autographiviridae |
| 009388065       | Unclassified Ackermannviridae |
| 009388225       | Unclassified Ackermannviridae  |


### Roary Section 
All necessary programs to obtain the final Roary figures were initially downloaded (Table 2 and 3). The gff files that were combined into the GFF directory were then used for the program Roary. After completion of Roary, the program produced an output directory called "steno" which contained 20 different files (Figure 2). Roary output data (gene_presence_absence.csv) was further processed to produce three figures: Pangenome frequency, Pangenome matrix, and Pangenome pie chart. This was accomplished with three steps. The first step was to obtain `roary_plots.pry` a script that produces the output figures [3]. The second step was to use the alignment file (core_gene_alignmnet.aln) produced by Roary in the program FastTree to generate a phylogenetic tree [4]. And lastly, this was all compiled into one code: `python roary_plots.py core_gene_alignment.nwk gene_presence_absence.csv` [2].       

**Table 2**: Install Codes for Roary.
| Installation of Roary Program |
| ------------------------ |
| conda config --add channels r |
| conda config --add channels defaults |
| conda config --add channels conda-forge |
| conda config --add channels bioconda |
| conda install roary |

**Table 3**: Install Codes for Additional Programs required.
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
Additionally, after completion of the Roary program, R files were also obtained and downloaded. The R files were processed with the used of an [R script](https://github.com/sanger-pathogens/Roary/blob/master/bin/create_pan_genome_plots.R) provided by Andrew Page [5]. 

## Results
Pangenome frequency was assessed and plotted on a graph that contained the number of genes on the y-axis against the genomes evaluated on the x-axis. Blue bars represent the number of genes found in a single genome with elevated frequencies. The steno phages that were analyzed only contained three genomes that had a gene frequency greater than zero (Figure 3). The pangenome matrix, or the Roary matrix, assessed if the phages were distinctly different from one another regarding the presence and absence of core and accessory genes. The navy blue indicates the presence of similarities while the light blue represents the absence of similarities. The total amount of genes in the analysis was 795 which encompassed all eight genomes. Furthermore, the matrix also demonstrates that the eight phage genomes varied in size (Figure 4). The pangenome pie chart is a breakdown of the different type of gene which includes core gene, softcore genes, shell genes, and cloud genes. No core or soft-core genes were present in the eight evaluated steno phages; however, there were 213 shell genes noted which includes genes present in 2 or more strains. Cloud genes included 582 and are only found in a single strain (Figure 5) [6]. Conserved versus total genes were also assessed across all eight steno phages. The total number of genes which was represented by a dotted line almost reached 800 genes, while only 3 strains contained conserved genes, represented by a black line (Figure 6).  

![Pangenome-frequency](https://i.ibb.co/DLYnXNy/pangenome-frequency.png) <br>
**Figure 3**: Pangenome Frequency. Frequency of genes versus the number of genomes analyzed.

![Pangenome-martix](https://i.ibb.co/MgGn3BB/pangenome-matrix.png) <br>
**Figure 4**: Pangenome Matrix. Tree comparison in a matrix format that illustrate the presence and absence of core and accessory genes.

![Pangenome-pie](https://i.ibb.co/8dQDn3G/pangenome-pie.png) <br>
**Figure 5**: Pangenome Pie. A pie chart of the breakdown of genes and the number of isolate they are present in. 

![R](https://i.ibb.co/WVzqgxx/Conserved-vs-Total-Genes.png) <br>
**Figure 6**: Conserved versus Total Genes. 

## Discussion 
 



## Referency 
[1] Seemann, T. (2014). Prokka: rapid prokaryotic genome annotation. Bioinformatics, 30(14), 2068-2069. doi:10.1093/bioinformatics/btu153 <br>
[2] Page, A. J., Cummins, C. A., Hunt, M., Wong, V. K., Reuter, S., Holden, M. T. G., . . . Parkhill, J. (2015). Roary: rapid large-scale prokaryote pan genome analysis. Bioinformatics, 31(22), 3691-3693. doi:10.1093/bioinformatics/btv421 <br>
[3] https://github.com/sanger-pathogens/Roary/blob/master/contrib/roary_plots/roary_plots.py <br>
[4] Price, M. N., Dehal, P. S., & Arkin, A. P. (2010). FastTree 2--approximately maximum-likelihood trees for large alignments. PLoS One, 5(3), e9490. doi:10.1371/journal.pone.0009490 <br>
[5] https://github.com/sanger-pathogens/Roary/blob/master/bin/create_pan_genome_plots.R  <br>
[6] Koonin, E. V., & Wolf, Y. I. (2012). Evolution of microbes and viruses: a paradigm shift in evolutionary biology? Front Cell Infect Microbiol, 2, 119. doi:10.3389/fcimb.2012.00119 <br>
[7]
