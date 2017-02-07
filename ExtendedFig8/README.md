RNA-seq of Tumor-associated Endothelial Cells from Different Immunodeficient Backgrounds
========
  
  To investigate the impact of CD4+ T cells on tumor vasculature, we performed transcriptome profiling on tumor-associated endothelial cells in mice with or without functional CD4 T cells. In addition to examining four pathways that affect vessel maturation (**VEGFA**, **ANGPT1/ANGPT2**, **TGFbR**, and **sphingolipid metabolism**), we ran Gene Set Enrichment Analysis (**GSEA**) and found a down-regulation of cellular adhesion and extracellular matrix assembly-related pathways in the CD4 T cell deficient group. This suggests that CD4+ T cells play an important role in promoting tumor vessel integrity and normalization.

**ExtendedFig8.Rmd** contains the source code for **Extended Data Fig. 8b-h**.

## Data Download

The raw RNA-seq read fastq files and processed normalized gene expression data (**RData** format) can be download from [GSE89758]( https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?token=onstcsssvxolxmd&acc=GSE89758).

* `RSEM Count Matrix`: 20 RSEM read quantification files for 20 samples (containing Transcript Per Million (TPM) and Fragments Per Kilobase of transcript per Million (FPKM) information);  You can use `rsem-generate-data-matrix` to generate the reads counting matrix.

```
rsem-generate-data-matrix *_RSEM.genes.results > VN.txt
```

* `VN.Rdata`: sample annotation table and gene expression matrix tables with mouse gene symbols or ortholog human gene symbols as row names.
* Raw RNA-seq reads are saved in **.sra** format. You need install [sra-tools v2.3.5-2](https://github.com/ncbi/sra-tools) and run the command below to extract the pair-end sequencing data.

```
fastq-dump -I --split-3 SRRXXXXXXX.sra
```

## Data Processing Overview

Illumina Nextseq 500 automatically used **bcl2fastq2** (version 2.17) for basecalling. FASTQ files were downloaded from BaseSpace.

RNA-seq NGS reads were mapped using [STAR](https://github.com/alexdobin/STAR) RNA-seq aligner (version 2.4.1d) and quantified using [RSEM](http://deweylab.github.io/RSEM/) (version 1.2.28). The bash code can be found in **RNAseqReadsMapping.sh**.

Average insert sizes were calculated for each sample. Consistent with Bioanalyzer electrophoresis plot, one sample (**CD4KO_9768**) was shown to be an outlier and was removed before proceeding to downstream analysis. An outlier is defined as a number that is more than 1.5 times the inter-quartile range away from either the lower or upper quartiles. Speciﬁcally, if a number is less than `Q1 - 1.5×IQR` or greater than `Q3 + 1.5×IQR`, then it is an outlier.

[DEseq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) v1.14.1 R package was used to normalize the gene expression matrix. The R code for data normalization can be found in `RNAseqDataNormalization.Rmd`. The normalization data can be directly download from [GSE89758]( https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?token=onstcsssvxolxmd&acc=GSE89758).

## Gene Set Enrichment Analysis

Because the [GSEA](http://software.broadinstitute.org/gsea/index.jsp) MSigdb only support human gene symbols, we cannot apply our RNA-seq data (mouse tumor endothelial cells) directly. There are two options: **1)** Convert mouse gene symbol to human gene symbol as we have done for **ssGSEA** projection. This may cause loss of some genes as not all the mouse genes have human ortholog. **2)** Used mouse version gene set file.

We can use curated mouse version Gene Ontology Biological Process Gene Set database from [Bader Lab's GeneSets](http://baderlab.org/GeneSets). Go to their [FTP portal](http://download.baderlab.org/EM_Genesets/). In the manuscript, we use the **Mouse_GOBP_AllPathways_no_GO_iea_May_24_2015_symbol.gmt** of [May_24_2015/](http://download.baderlab.org/EM_Genesets/May_24_2015/Mouse/symbol/) version.

## Other Souece Codes

The souece codes for **Extended Data Fig. 8b-h** can be found in **ExtendedFig8.Rmd**.
 