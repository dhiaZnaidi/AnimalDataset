function [BW,maskedRGBImage] = createMaskLions(RGB,idx)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

% Auto-generated by colorThresholder app on 18-Mar-2023
%------------------------------------------------------


% Convert RGB image to chosen color space
I = rgb2hsv(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.164;
channel1Max = 0.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.000;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 1.000;

% Create mask based on chosen histogram thresholds
sliderBW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = ~BW;

[rows, cols] = size(BW);
% Create a binary image with the same size as the reference image, filled with ones
binaryImage = zeros(rows-759, cols);

BW(760:end,:) =binaryImage;

if ((idx >= 166) && (idx <= 630))
    binaryImagebottom = zeros(rows-639, cols);
    BW(640:end,:) =binaryImagebottom;

end

%45 ->103 220->270 col 1430  105->220 col 640

if (((idx >= 4) && (idx <= 160)) || ((idx >= 200) && (idx <= 270)))
    binaryImagebis = zeros(rows, cols-1429);
    BW(:,1430:end) =binaryImagebis;

end

if ((idx >= 105) && (idx <= 280))
    binaryImagebis1 = zeros(rows, 640);
    BW(:,1:640) =binaryImagebis1;

end

if ((idx >= 1) && (idx <= 60))
    binaryImagebis1 = zeros(rows, 570);
    BW(:,1:570) =binaryImagebis1;

end


% Initialize output masked image based on input image.
maskedRGBImage = RGB;


img = im2gray(maskedRGBImage);
imgFilt = imgaussfilt(img,1.75);
[imgEdge, ~] = edge(imgFilt,"sobel","nothinning");

BW = ~imgEdge & BW;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
