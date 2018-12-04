%Main
clc
clear

% read image and make to a binary picture
Image = imread('Images_Training/im13s.jpg');
Im = im2double(Image);
Im_grey =rgb2gray(Im);
% imshow(Im_grey);
% figure;
threshhold = graythresh(Im_grey);
%threshhold = 0.9;
BW = Im_grey<threshhold;

%Find staff lines and get top position where we stop take into account the
%things over
BW = MyHough(BW, BW);
%BW = imcrop(BW,[20 20 size(BW,1)-200 size(BW,2)-100]);
%BW = BW<threshhold;
imshow(BW)
Staff = FindStaffLines(BW, 0.4);
Length = LenghtBetweenStaffLines(Staff); 
Top = min(min(Staff))-Length*4;


% Staff areas
SizeOfStaffArea = [120, 1000];
StaffAreas = DividedIntoStaffAreas(BW,Staff, Length);
NumberOfStaffAreas =size(Staff,2)/5;
StaffAreasResized = imresize(StaffAreas, 10/Length);
%  for i = 1:1:NumberOfStaffAreas
%        figure
%        imshow(StaffAreas(:,:,i));      
%  end
 
  for i = 1:1:NumberOfStaffAreas
      Staff = FindStaffLines(StaffAreasResized(:,:,i),0.6);
      Length = LenghtBetweenStaffLines(Staff);
      GKlaus = FindGklaus(StaffAreasResized(:,:,i));
      NoteHeads = FindNoteHeads(StaffAreasResized(:,:,i), GKlaus);   
      String = SortNoteHeads(NoteHeads, Staff, Length);
      disp(join(String));
 end



 
 
%imshow(Image);

%ans = tnm034(Im);