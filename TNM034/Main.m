%Main
% read image and make to a binary picture
Image = imread('Images_Training/im1s.jpg');
Im = im2double(Image);
Im_grey =rgb2gray(Im);
threshhold = 0.9;
BW = Im_grey<threshhold;

%Find staff lines and get top position where we stop take into account the
%things over
Staff = FindStaffLines(BW);
Length = LenghtBetweenStaffLines(Staff); 
Top = min(min(Staff))-Length*4;

StaffAreas = DividedIntoStaffAreas(BW,Staff, Length);
NumberOfStaffAreas =size(Staff,2)/5;
StaffAreas = imresize(StaffAreas, 10/Length);
 for i = 1:1:NumberOfStaffAreas
       figure
       imshow(StaffAreas(:,:,i));      
 end


 
 for i = 1:1:NumberOfStaffAreas
       
 end
 
 
%imshow(Image);

%ans = tnm034(Im);