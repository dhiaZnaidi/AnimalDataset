function [BW,maskedRGBImage] = BlurrandSegmentCygne(RGB)
    img = im2gray(RGB);
    imgFilt = imgaussfilt(img,5);
    [imgEdge, ~, ~, ~] = edge(imgFilt,"roberts","nothinning");
    [BW,~] = createMaskCygne(RGB);
    test_mask = im2double(Th & imgEdge);
    premask = segmentImagetestMask(test_mask);
    BW = Th & premask;
    % Initialize output masked image based on input image.
    maskedRGBImage = RGB;
    
    % Set background pixels where BW is false to zero.
    maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end