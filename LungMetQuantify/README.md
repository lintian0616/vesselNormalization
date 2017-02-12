## Description of Texture Segmentation Algorithm

Representative H&E staining showing the features of lung normal tissues, tumor metastasis, and background. Lung tissue has the highest entropy and the background has the lowest entropy.

![1](https://raw.githubusercontent.com/lintian0616/vesselNormalization/master/LungMetQuantify/IllustrationImages/1.jpg?token=AG381lDL6rAUlIQAS4y3_o-icVNMVuBvks5YqeGgwA%3D%3D)

### Steps involved in texture segmentation.

![2](https://raw.githubusercontent.com/lintian0616/vesselNormalization/master/LungMetQuantify/IllustrationImages/2.jpg?token=AG381pNS0ndjJNm6qyv2GVLDV30aVyBfks5YqeG9wA%3D%3D)

### Example Outputs

The `examples.m` will implement `TextureSegEntropy.m`, and analyze the four whole section scanning images (**9448_3_TCRKO.TIF**, **9713_2_CD8KO.TIF**, **9716_1_CD4KO.TIF**, **9943_5_WT.TIF**) provided.

The original images (**left**) and the texture segmented images (**right**) are shown below. The blackened areas are the tumor tissues.

![3](https://raw.githubusercontent.com/lintian0616/vesselNormalization/master/LungMetQuantify/IllustrationImages/3.jpg?token=AG381mAuu_5Xjo8IYdxmjLLu8AsFTtFtks5YqeHJwA%3D%3D)

### Acknowledgement

We thank the feedback provided by Zhoubing Xu and Guotai Wang on MATLAB code.

