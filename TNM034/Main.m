%Main
clc
clear

% read image and make to a binary picture
Image = imread('Images_Training/im1s.jpg');
out = tnm034(Image);
disp(out);
