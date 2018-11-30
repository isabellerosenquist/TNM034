%Main
% read image and make to a binary picture
Image = imread('Images_Training/im6s.jpg');
Im = im2double(Image);
Im_grey =rgb2gray(Im);
threshhold = 0.9;
BW = Im_grey<threshhold;

%Find staff lines and get top position where we stop take into account the
%things over
Staff = FindStaffLines(BW);
Length = LenghtBetweenStaffLines(Staff); 
Top = min(min(Staff))-Length*4;


% Staff areas
SizeOfStaffArea = [120, 1000];
StaffAreas = DividedIntoStaffAreas(BW,Staff, Length);
NumberOfStaffAreas =size(Staff,2)/5;
StaffAreasResized = imresize(StaffAreas, SizeOfStaffArea);
%  for i = 1:1:NumberOfStaffAreas
%        figure
%        imshow(StaffAreas(:,:,i));      
%  end
 
  for i = 1:1:NumberOfStaffAreas
      Staff = FindStaffLines(StaffAreasResized(:,:,i));
      Length = LenghtBetweenStaffLines(Staff);
      GKlaus = FindGklaus(StaffAreasResized(:,:,i));
      NoteHeads = FindNoteHeads(StaffAreasResized(:,:,i), GKlaus);   
      SortNoteHeads(NoteHeads, Staff, Length);
 end


 
 
%imshow(Image);

%ans = tnm034(Im);