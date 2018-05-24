HDncRNA
=======
This project contains all code used during constructioin of HDncRNA

### 1. search_in_Pubmed
E-Utilities is called to complete search and fetch missions. In this folder, we provided xx perl scripts and xx list files. Below is the introduction about every file.
#### combine_lncRNA_with_heart_disease_name.pl
This script is used to combine disease key words and ncRNA names.
#### search_and_get_pmid_list_of_result.pl
This script is used to search in Pubmed and fetch target Pubmed IDs.
#### heart_disease_name.txt
This file contains all heart diseases, which are used to be search key words.

### 2. distinction_lncRNA_from_RNA-seq 
This folder contains shell script which is used to identify lncRNA by sequence’s length, ORF length and coding potential.

#### length_filter.pl
This script uses .diff file created by Cuffdiff as input file, and the output file is named as "length_over_200_po_lnc.diff" and transcripts in this file are all longer than 200bp. Output file in this progress will be input file of [ORFpredictor](http://bioinformatics.ysu.edu/tools/OrfPredictor.html).
#### orf_filter.pl
This file uses the output file of [ORFpredictor](http://bioinformatics.ysu.edu/tools/OrfPredictor.html) as input file, and the output file is the list file contains transcripts which predicted ORF is less than 300bp. Output file in this progress will be input file of  [Coding Potential Calculator](http://cpc.cbi.pku.edu.cn/).
