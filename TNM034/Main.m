%Main
Image = imread('Images_Training/im1c.jpg');
Im = im2double(Image);

Im_grey =rgb2gray(Im);
BW= edge(Im_grey, 'log');
%%BW = imbinarize(Im_grey);
[B,L] = bwboundaries(BW,'noholes');

%[S,T] = B(:,1);

B_size = cellfun('size',B,1); 

%imshow(L);
%ans = tnm034(Im);