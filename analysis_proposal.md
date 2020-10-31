# Analysis Proposal for EE282 Final Project

Author: Alisha Monsibais

## Introduction

The purpose of this bioinformatic projects is to characterize the eight steno phages isolated in the Whiteson lab during the summer of 2020. These eight steno phages could be an interesting avenue for treatment of _Stenotrophomonas maltophilia_ infections. _S. maltophilia_ is an emerging opportunistic pathogen that is difficult to treat with antibiotics, which is why our lab is interested in Phage Therapy (Brooke, 2012). Phage Therapy uses bacteriophages, or viruses that infect bacteria, to target and destroy the bacteria host cells (Golkar et al., 2014). The proposed analyses of this project includes examining the genomes of these bacteriophages to understand the core genes needed in infection as well as examining the phylogenetic relationship of the bacteriophages and comparing that information to host-range study that will be completed during my fall rotation.

## Body Paragraph 

The eight steno phages that were sent out for sequencing will be obtained in FASTQ format which will need to be processed into FASTA format. These FASTA files will then be processed in a bacteriophage specific aligner called alpha (Berard et al., 2016). If data is not received in time, eight stand-in steno phage genomes will be obtained form GenBank in FASTA format (see reference section). The key goal for this bioinformatics analyses includes characterizing and analyzing the genetic information of these bacteriophages. The strategies that will be employed will include the program Roary (Page et al., 2015) for comparative genomics while phylogenetic analysis will be explored with the use of ClustalW and MEGA6 (Hall, 2013).
 
The results for the pan genomic analysis will include graphical representation of the eight strands on the x-axis and the number of analyzed genes on the y-axis. This will provide information into the core genes these bacteriophages contain as well as the diversity in the accessary genes or genomes. Furthermore, ClustalW will be used for the sequence alignment which is needed for the phylogenetic analysis while the visualization of the phylogenetic tree will be done with MEGA6. This will aid in identifying if similar bacteriophages have similar infection characteristic which will be completed in the benchwork (host-range study). 

## Conclusion

This project will challenge my bioinformatic skillset; however, it will also help me to better understand project organize strategize, using and troubleshooting various software/pipelines as well as compile data into visual representation for public understanding. This is a feasible project as it contains a small sample size, and the genomes of interest are bacteriophages which are generally smaller in nature. This question will help me gain insight into Phage Therapy that will not only aid in my understanding of bacteriophage but also host-viral interactions. Additionally, this entry level project will also help me to gain insight on the use of bioinformatics and how I can apply bioinformatics to complement my benchwork.

## References

1.	Berard, S., Chateau, A., Pompidor, N., Guertin, P., Bergeron, A., & Swenson, K. M. (2016). Aligning the unalignable: bacteriophage whole genome alignments. BMC Bioinformatics, 17, 30. doi:10.1186/s12859-015-0869-5
2.	Brooke, J. S. (2012). Stenotrophomonas maltophilia: an emerging global opportunistic pathogen. Clin Microbiol Rev, 25(1), 2-41. doi:10.1128/CMR.00019-11
3.	Golkar, Z., Bagasra, O., & Pace, D. G. (2014). Bacteriophage therapy: a potential solution for the antibiotic resistance crisis. J Infect Dev Ctries, 8(2), 129-136. doi:10.3855/jidc.3573
4.	Hall, B. G. (2013). Building phylogenetic trees from molecular data with MEGA. Mol Biol Evol, 30(5), 1229-1235. doi:10.1093/molbev/mst012
5.	Page, A. J., Cummins, C. A., Hunt, M., Wong, V. K., Reuter, S., Holden, M. T. G., . . . Parkhill, J. (2015). Roary: rapid large-scale prokaryote pan genome analysis. Bioinformatics, 31(22), 3691-3693. doi:10.1093/bioinformatics/btv421

## Hyperlinks

1. [Alpha Aligner](https://bitbucket.org/thekswenson/alpha/src/master/)
1. [Roary](http://sanger-pathogens.github.io/Roary/)
1. [ClustalW & MEGA6](https://academic.oup.com/mbe/article/30/5/1229/992850)

## GenBank Steno Phage Genomes

1. [GenBank: MG189906.1](https://www.ncbi.nlm.nih.gov/nuccore/MG189906)
1. [GenBank: KR560069.1](https://www.ncbi.nlm.nih.gov/nuccore/KR560069)
1. [GenBank: MK903280.1](https://www.ncbi.nlm.nih.gov/nuccore/MK903280)
1. [NCBI Reference Sequence: NC_049463.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_049463.1)
1. [NCBI Reference Sequence: NC_023588.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_023588.1)
1. [NCBI Reference Sequence: NC_019416.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_019416.1)
1. [NCBI Reference Sequence: NC_048802.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_048802.1)
1. [NCBI Reference Sequence: NC_048804.1](https://www.ncbi.nlm.nih.gov/nuccore/NC_048804.1)
