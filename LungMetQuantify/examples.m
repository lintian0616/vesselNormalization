% Apply Texture Segmentation Algorithm on Example RGB Images.
% Click "command" + "return" to execute current section.

%% WT
[normal_WT, tumor_normal] = TextureSegEntropy('9943_5_WT.TIF');

%% CD4KO
[normal_CD4KO, tumor_CD4KO] = TextureSegEntropy('9716_1_CD4KO.TIF');

%% CD8KO
[normal_CD8KO, tumor_CD8KO] = TextureSegEntropy('9713_2_CD8KO.TIF', 6000, 0.78);

%% TCRKO
[normal_TCRKO, tumor_TCRKO] = TextureSegEntropy('9448_3_TCRKO.TIF', 8000);