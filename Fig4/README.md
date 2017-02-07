**hypoxia.RData** contains 4 hypoxia-related gene sets.

* **hypo1**: 28-genes hypoxia signature. This gene set is curated from this [PLOS MEDICIND](http://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.0030047) paper.
* **hypo2**: 26-gene hypoxia signature. This gene set is from this [Clinical Cancer Research](http://clincancerres.aacrjournals.org/content/19/17/4879.long) paper.
* **pimo**: 32-gene set that correlates with higher pimonidazole staining in human tumors. This gene set is from this [British Journal of Cancer](https://www.ncbi.nlm.nih.gov/pubmed/25461803) paper.
* **vegf**: 14-gene set that correlates with higher VEGF signaling in human tumors. This gene set is from this [BMC Medicine](https://bmcmedicine.biomedcentral.com/articles/10.1186/1741-7015-7-9) paper.

In the paper, we use **hypo2**, **pimo** and **vegf** signature.

**PDX\_Microarray\_Process.Rmd** is the source code that process the patient-derived xenograft (PDX) gene expression profiling data from bladder cancer ([GSE67312](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE67312)), breat cancer ([GSE32531](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE32531), [GSE41685](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE41685), [GSE34412](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE34412)), liver cancer ([GSE55828](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE55828)), and ovarian cancer ([GSE56920](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE56920)). The processed data is saved as **PDX.Hypoxia.RData**. Please note, this object is not the full datasets; we only keep hypoxia signature genes in the expression matrix.

**Fig4.Rmd** is used to generate the **Fig. 4a,b,j**.