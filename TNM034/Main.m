%Main
clc
clear

% read image and make to a binary picture
Image = imread('Images_Training/im1s.jpg');
ans = tnm034(Image);
disp(ans);
% Im = im2double(Image);
% Im_grey =rgb2gray(Im);
% % imshow(Im_grey);
% % figure;
% threshhold = graythresh(Im_grey);
% %threshhold = 0.9;
% BW = Im_grey<threshhold;
% 
% %Find staff lines and get top position where we stop take into account the
% %things over
% %BW = OldHough(BW, BW);
% BW = MyHough(BW);
% Staff = FindStaffLines(BW, 0.4);
% [Length,NumberOfStaffAreas]  = LenghtBetweenStaffLines(Staff); 
% 
% 
% % Staff areas
% StaffAreas = DividedIntoStaffAreas(BW, Staff, Length, NumberOfStaffAreas);
% ResizedStaffAreas = imresize(StaffAreas,10/Length);
% 
% %Get the own made structural element
% str = imread('Templetes/im6s.jpg');
% str = imresize(str, [7,7]);
% str = im2double(str);
% str =rgb2gray(str);
% threshhold = graythresh(str);
% str = str<threshhold;
% 
%   for i = 1:1:NumberOfStaffAreas
%       Staff = FindStaffLines(ResizedStaffAreas(:,:,i),0.6);
%       Length = LenghtBetweenStaffLines(Staff);
%       GKlaus = FindGklaus(ResizedStaffAreas(:,:,i));
%       NoteHeads = FindNoteHeads(ResizedStaffAreas(:,:,i), GKlaus, str);
%       String = SortNoteHeads(NoteHeads, Staff, Length, ResizedStaffAreas(:,:,i));
%       disp((String));
%   end
% 
% %ans = tnm034(Im);