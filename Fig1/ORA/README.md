`VennDiagram.Rmd` is used to generate **Fig1 f**.

30 **GPAGs** and 27 **PPAGs** can be loaded from `data`, and used as input for [KOBAS](http://kobas.cbi.pku.edu.cn/index.php).

```{r}
load("~/vesselNormalization/data/GPAGs_PPAGs.RData")
```

The outputs of [KOBAS](http://kobas.cbi.pku.edu.cn/index.php) (`GPAGsDis.identify` and `PPAGsDis.identify`, see `vesselNormalization/data` folder) are downloaded. The pathways in Gene Ontology Biological Process databased were saved in csv format (`GPAGsDisGO.csv` and `PPAGsDisGO.csv`). As stated in the extended figure legend, the pathways with *p* < 0.01 are selected for Venn Diagram and [REVIGO](http://revigo.irb.hr/) plot.