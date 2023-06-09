function [BW,maskedImage] = segmentImageBear(RGB)
%segmentImage Segment image using auto-generated code from Image Segmenter app
%  [BW,MASKEDIMAGE] = segmentImage(RGB) segments image RGB using
%  auto-generated code from the Image Segmenter app. The final segmentation
%  is returned in BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 16-Mar-2023
%----------------------------------------------------


% Convert RGB image into L*a*b* color space.

% Threshold image - manual threshold
BW = im2gray(RGB) > 0;

% Fill holes
BW = imfill(BW, 'holes');

% Close mask with default
radius = 9;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imclose(BW, se);

% Close mask with default
radius = 11;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imclose(BW, se);

% Fill holes
BW = imfill(BW, 'holes');

% Erode mask with default
radius = 10;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imerode(BW, se);

% Erode mask with line
length = 11.000000;
angle = 0.000000;
se = strel('line', length, angle);
BW = imerode(BW, se);

% Dilate mask with disk
radius = 14;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imdilate(BW, se);

% Create masked image.
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end

