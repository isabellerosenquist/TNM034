%Main
clc
clear

Image = imread('Images_Training/im1s.jpg');
out = tnm034(Image);
disp(out);

