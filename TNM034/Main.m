%Main
Image = imread('Images_Training/im6s.jpg');
Im = im2double(Image);
Im_grey =rgb2gray(Im);
threshhold = 0.9;
BW = Im_grey<threshhold;


%imshow(NoStaffBW);

ans = tnm034(Im);