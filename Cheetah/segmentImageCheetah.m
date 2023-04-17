function [BW,maskedImage] = segmentImageCheetah(RGB)
%segmentImage Segment image using auto-generated code from Image Segmenter app
%  [BW,MASKEDIMAGE] = segmentImage(RGB) segments image RGB using
%  auto-generated code from the Image Segmenter app. The final segmentation
%  is returned in BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 16-Mar-2023
%----------------------------------------------------


% Convert RGB image into L*a*b* color space.

% Threshold image - manual threshold
BW = im2gray(RGB) > 1.836600e-01;

% Fill holes
BW = imfill(BW, 'holes');

% Close mask with default
radius = 4;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imclose(BW, se);

% Erode mask with default
radius = 5;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imerode(BW, se);

% Open mask with default
radius = 4;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imopen(BW, se);

% Dilate mask with square
width = 19;
se = strel('square', width);
BW = imdilate(BW, se);

% Create masked image.
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end

