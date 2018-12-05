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

imshow(BW)
Staff = FindStaffLines(BW, 0.4);
[Length,NumberOfStaffAreas]  = LenghtBetweenStaffLines(Staff); 
Top = min(min(Staff))-Length*4;


% Staff areas
SizeOfStaffArea = [120, 1000];
StaffAreas = DividedIntoStaffAreas(BW, Staff, Length, NumberOfStaffAreas);

str = imread('Templetes/im6s.jpg');
str = imresize(str, [7,7]);
str = im2double(str);
str =rgb2gray(str);
threshhold = graythresh(str);
str = str<threshhold;

  for i = 1:1:NumberOfStaffAreas
      Staff = FindStaffLines(StaffAreas(:,:,i),0.6);
      Length = LenghtBetweenStaffLines(Staff);
      GKlaus = FindGklaus(StaffAreas(:,:,i));
      NoteHeads = FindNoteHeads(StaffAreas(:,:,i), GKlaus, str);   
      String = SortNoteHeads(NoteHeads, Staff, Length);
      disp(join(String));
 end



 
 
%imshow(Image);

%ans = tnm034(Im);