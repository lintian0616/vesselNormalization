We asked if activated T cells preferentially co-localize with endothelial cells. We adoptively transferred tdRFP+ stimulated CD4+ T cells and tdRFP+;CFSE+ CD4+ naïve T cells into the E0771 tumor-bearing TCRKO mice. T cell activation is almost always accompanied by proliferation, which would lead to a dilution of CFSE. Therefore, this assay allowed us to distinguish low CFSE intensity T cells activated in vivo from naïve T cells with high CFSE intensity.

We then performed whole section mosaic scanning and image simulation to study spatial distributions of the transferred CD4+ T cells and functional tumor vessels (lectin+).

Here are the descriptions of 4 channels:

* **DAPI**: Nuclear Stains; this is used to define tumor boundary edge;
* **Cy2**: CFSE; this is used to identify CD4+ naïve T cells (tdRFP+;CFSE+);
* **Cy3**: tdRed; this is the marker for adoptive transferred CD4+ T cells;
* **Cy5**: lectin; this is used as a marker for functional/normalized tumor vessel.

We deposited large mosaic imaging files to [figshare](https://figshare.com/), which can be downloaded from this [link](https://figshare.com/articles/New_draft_item/4625140).

After downloading the files, we used [imageJ](https://imagej.nih.gov/ij/) to manually remove the background. Here are the threshold we choose for background removal. Because the file is very big (**single channel image is more than 1GB**), you need at least 16GB RAM space to analyze the images. After opening imageJ, go to `Edit` -> `Options` -> `Memory & Threads...`. Change the **Maximum memory** to **16000MB**. Restart the imageJ, and you should be able to open the images.

* **DAPI**: 10-195
* **Cy2** (CFSE): 50-255
* **Cy3** (tdRed): 50-255
* **Cy5** (lectin): 10-255

For the **DAPI** channel, we only interested in the boundary edge areas, we used **Freehand selection** tools in imageJ to select the boundary edge of the tumor, then choose `File` -> `Save as` -> `XY Coordinates...` to save the boundary edge. This is used in generating random points in image simulation.

We then used **Watershed** algorithm to identify CD4+ T cells and lectin+ cells.

* `Process` -> `Binary` -> `Make Binary`
* `Process` -> `Binary` -> `Watershed`
* `Analyze` -> `Analyze Particles...` -> `Size (1000-Inf)`, `Circularity (0.75-1.00)`, `Mask`, `Record Start`

The quantification source data are saved as **ImageSimulation.xlsx** in `vesselNormalization/data` folder. There are 4 sheets.

* **DAPI** sheet: the localization of tumor boundary edge area.
* **Cy2** sheet: the minimum distance between tdRed+;CFSE+ CD4+ naïve T cells and lectin+ vessel. Since there is very limited number (6 in all), this distance is calculated manually.
* **Cy3** sheet: the localization of tdRed+ stimulated/activated CD4+ T cells. This is automatically quantified by imageJ.
* **Cy5** sheet: the localization of lectin+ endothelial cells. This is automatically quantified by imageJ.
