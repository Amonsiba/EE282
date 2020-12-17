# Final Project

Author: Alisha Monsibais

## Methods
### Data Used for Bioinformatic Project  
The genomes of the following eight steno phages were downloaded from NCBI: [MG189906.1](https://www.ncbi.nlm.nih.gov/nuccore/MG189906), [KR560069.1](https://www.ncbi.nlm.nih.gov/nuccore/KR560069), [MK903280.1](https://www.ncbi.nlm.nih.gov/nuccore/MK903280), [NC_049463.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_049463.1), [NC_023588.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_023588.1), [NC_019416.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_019416.1), [NC_048802.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_048802.1), [NC_048804.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_048804.1), and family/genus information was organized (Table 1). This data was obtained in compressed (gzip) fasta format and placed into the raw data directory for further processing. The data was unzipped and processed into a general feature format (gff) with the use of Prokka Program. Prokka is a program that rapidly annotates bacterial, archaeal, and viral genomes by identifying important features in the DNA sequence and labeling them with useful information [1]. General feature format is a format that produces tab-delimited fields per line and is the required input file type for the Roary program [2]. All gff files were labeled with the steno phage identifier from NCBI and placed into a GFF directory (Figure 1). 

![gff](https://i.ibb.co/68DDJV6/gff.png) <br>
**Figure 1**: All processed gff files located in GFF directory.   

**Table 1**: NCBI Identifiers and Family/Genus Information 
| NCBI Identifier | Family/Genus |
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
All necessary programs to obtain the final Roary figures were initially downloaded (Table 2 and 3). The gff files that were combined into the GFF directory were then used for the program Roary. The following was used for the Roary code: `roary -f ./steno -e -n -v -t 1 ./GFF/*.gff`. The syntax -e was used to create a multiFASTA alignment of core genes using PRANK. The syntax -n was used uses fast core gene alignment with MAFFT. The syntax -v was for verbose while -t 1 was used for viral data processing. After completion of Roary, the program produced an output directory called "steno" which contained 20 different files (Figure 2). Roary output data (gene_presence_absence.csv) was further processed to produce three figures: Pangenome frequency, Pangenome matrix, and Pangenome pie chart. This was accomplished with three steps. The first step was to obtain `roary_plots.pry` a script that produces the output figures [3]. The second step was to use the alignment file (core_gene_alignmnet.aln) produced by Roary in the program FastTree to generate a phylogenetic tree [4]. And lastly, this was all compiled into one code: `python roary_plots.py core_gene_alignment.nwk gene_presence_absence.csv` [2].       

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
 
Overall, the analysis of this project demonstrates that the eight steno phages evaluated are distinctly different from one another. This is supported by the literature as bacteriophages are the most abundant and diverse biological element in the world [7]. With the complied analysis, three phages consistently demonstrated similarities throughout the investigation. This was noted in the pangenome frequency in which three genomes were identified to have elevated frequencies (Figure 3). Additionally, the pangenome matrix also identified three genomes that contain similarities in comparison to their presence and absence of core and accessory genes in the beginning section of the graph (Figure 4). Since no core genes were identified in the pangenome pie chart (Figure 5), these similarities must have come from shell genes which were assessed as 213 genes with this data set. The conserved versus total genes also denoted three genomes with the black line (Figure 6), indicating that conserved genes were only present in three of the eight strains. When reviewing the family/genus of all the bacteriophages, three of the selected phages were within the same family, Ackermannviridae. All of them were considered unclassified Ackermannviridae at the genus level, also supporting that even if these viruses are distantly related, they are also distinct from one another. 

Furthermore, since core genes are mainly associated with housekeeping gene, it would make sense that viral genomes would lack these particular genes [8]. This is because viral genomes most likely use host housekeeping genes when they take over cellular machinery [2]. For future direction of this project, I would like to assess the host genomes as I feel this would contain and establish more pertinent information regarding the phage-bacteria interactions. Ultimately, by explore phage-bacteria interactions using a bioinformatic approach we wish to provide further supporting evidence that Phage Therapy is a viable treatment option.  

## References 

[1] Seemann, T. (2014). Prokka: rapid prokaryotic genome annotation. Bioinformatics, 30(14), 2068-2069. doi:10.1093/bioinformatics/btu153 <br>
[2] Page, A. J., Cummins, C. A., Hunt, M., Wong, V. K., Reuter, S., Holden, M. T. G., . . . Parkhill, J. (2015). Roary: rapid large-scale prokaryote pan genome analysis. Bioinformatics, 31(22), 3691-3693. doi:10.1093/bioinformatics/btv421 <br>
[3] https://github.com/sanger-pathogens/Roary/blob/master/contrib/roary_plots/roary_plots.py <br>
[4] Price, M. N., Dehal, P. S., & Arkin, A. P. (2010). FastTree 2--approximately maximum-likelihood trees for large alignments. PLoS One, 5(3), e9490. doi:10.1371/journal.pone.0009490 <br>
[5] https://github.com/sanger-pathogens/Roary/blob/master/bin/create_pan_genome_plots.R  <br>
[6] Koonin, E. V., & Wolf, Y. I. (2012). Evolution of microbes and viruses: a paradigm shift in evolutionary biology? Front Cell Infect Microbiol, 2, 119. doi:10.3389/fcimb.2012.00119 <br>
[7] Kasman, L. M., & Porter, L. D. (2020). Bacteriophages. In StatPearls. Treasure Island (FL). <br>
[8] Medini, D., Donati, C., Tettelin, H., Masignani, V., & Rappuoli, R. (2005). The microbial pan-genome. Curr Opin Genet Dev, 15(6), 589-594. doi:10.1016/j.gde.2005.09.006
