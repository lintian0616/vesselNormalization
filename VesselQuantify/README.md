## Description of Tumor Vessel Quantification

We use [CellProfiler 2.2.0](http://cellprofiler.org/) to quantify the vessel normalization parameters such as vessel length/density and co-localization with lectin/VE-cadherin.

### Vessel Density Quantification

The cell profiler pipeline and example images can be found in the folder `VesselDensity`. You may need change the parameters before using the images on your samples.

Here, we illustrate how vessel density/length quantification works by intentionally choosing two images with low quanlity. (Blue: DAPI; Green: CD31; Red: NG2).

![1](IllustrationImages/1.jpg)

### Steps involved in texture segmentation.

An “Adaptive” algorithm was applied to remove background, and “Otsu” algorithm was used to segment individual vessel cells (Blue: DAPI; Green: Lectin; Red: CD31).

![2](IllustrationImages/2.jpg)


