function [mask1_pxl, mask3_pxl] = TextureSegEntropy(img, holesize, greythreshold)
% mask1_pxl: normal tissue
% mask3_pxl: tumor tissue

% Example1: [normal, tumor] = TextureSegEntropy('9715_5.TIF', 10000, 0.8)
% Example2 (Use default value for holesize): [normal, tumor2] = TextureSegEntropy('9050_1.TIF', [], 0.8)
% Example3 (Use default value for greythreshold): [normal, tumor] = TextureSegEntropy('9050_1.TIF', 10000, [])
% Example4 (Use default value for greythreshold): [normal, tumor] = TextureSegEntropy('9050_1.TIF', 10000)

% The default value for holesize = 10000 if not provided
if ~exist('holesize','var') || isempty(holesize), holesize = 10000; end
% If smaller metastasis in the middle not inluded, 
% decrease holdsize by 1000 each time.

% The default value for greythreshold = 0.8 if not provided
if ~exist('greythreshold','var') || isempty(greythreshold), greythreshold = 0.8; end
% If non-tumor tissue is included (smooth muscle tissue), 
% decrease greythreshold by 0.025 each time.

% Step 1: Read Image
rgbI = imread(img);
rgbIsmall = imresize(rgbI, 1);
I = rgb2gray(rgbIsmall);
I = wiener2(I,[5 5]);
subplot(2, 3, 1), imshow(rgbIsmall); title('RGB Image')
subplot(2, 3, 2), imshow(I); title('Gray Scale Image')

% Step 2: Create Texture Image
NHOODVAL = 9;
E = entropyfilt(I, true(NHOODVAL));
Eim = mat2gray(E);

% Step 3: Create Rough Mask for the Bottom Texture
BW1 = im2bw(Eim, greythreshold);
BWao = bwareaopen(BW1,2000);
closeBWao = imclose(BWao,true(NHOODVAL));
filled = imfill(closeBWao,'holes');
holes = filled & ~closeBWao;
bigholes = bwareaopen(holes, holesize);
smallholes = holes & ~bigholes;
roughMask = closeBWao | smallholes;
mask1_pxl = sum(roughMask(:));

% Step 4: Use Rough Mask to Segment the Top Texture, or "normal"
I2 = rgbIsmall;
I2_r = rgbIsmall(:,:,1);
I2_g = rgbIsmall(:,:,2);
I2_b = rgbIsmall(:,:,3);
I2_r(roughMask)=0;
I2_g(roughMask)=0;
I2_b(roughMask)=0;
I2(:,:,1) = I2_r;
I2(:,:,2) = I2_g;
I2(:,:,3) = I2_b;
subplot(2, 3, 3), imshow(I2); title('Normal Tissue')

I2_grey = I;
E2 = entropyfilt(I2_grey, true(NHOODVAL));
E2im = mat2gray(E2);
BW2 = im2bw(E2im,graythresh(E2im));
mask2 = bwareaopen(BW2,1000);

% Step 5: Display Segmentation Results
% mask2 mask all the tissues
texture = rgbIsmall;
texture_r = rgbIsmall(:,:,1);
texture_g = rgbIsmall(:,:,2);
texture_b = rgbIsmall(:,:,3);
texture_r(mask2)=0;
texture_g(mask2)=0;
texture_b(mask2)=0;
texture(:,:,1) = texture_r;
texture(:,:,2) = texture_g;
texture(:,:,3) = texture_b;

% mask3 is the complement of mask2 (mask2 - roughMask), or "tumor"
mask3 = mask2 - roughMask;
mask3_pxl = sum(mask3(:));
mask3 = logical(mask3);
texture2 = rgbIsmall;
texture2_r = rgbIsmall(:,:,1);
texture2_g = rgbIsmall(:,:,2);
texture2_b = rgbIsmall(:,:,3);
texture2_r(mask3)=0;
texture2_g(mask3)=0;
texture2_b(mask3)=0;
texture2(:,:,1) = texture2_r;
texture2(:,:,2) = texture2_g;
texture2(:,:,3) = texture2_b;

subplot(2, 3, 4), imshow(texture2); title('Tumor Tissue')
subplot(2, 3, 5), imshow(texture); title('Total Area')

boundary = bwperim(mask2);
segmentResults = rgbIsmall;
segmentResults_r = rgbIsmall(:,:,1);
segmentResults_g = rgbIsmall(:,:,2);
segmentResults_b = rgbIsmall(:,:,3);
segmentResults_r(boundary)=0;
segmentResults_g(boundary)=0;
segmentResults_b(boundary)=0;
segmentResults(:,:,1) = segmentResults_r;
segmentResults(:,:,2) = segmentResults_g;
segmentResults(:,:,3) = segmentResults_b;
subplot(2, 3, 6), imshow(segmentResults); title('Boundary Region')
