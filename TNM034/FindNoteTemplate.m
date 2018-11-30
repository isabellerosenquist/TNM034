function [ positions ] = FindNoteTemplate( Im_Grey )
%FINDNOTETEMPLATE Summary of this function goes here
%   Detailed explanation goes here

%Bra bilder: 3, 6, 9, 10, 13       %Dåliga bilder: 1, 5, 8

%Set variables for number of staffs per bar and threshold value
NrOfStaffs =5;
threshhold = 0.9;

%Find a suitable threshold value based on the image
thresh_percent = graythresh(Im_Grey);

BW = Im_Grey<thresh_percent;

%Detect staff lines
StaffLinesPos = FindStaffLines(BW, 0.6); %Ska inte vara 0.6, borde vara thresh_percent

% if(mod(size(StaffLinesPos, 2),5)~=0)
%     strout ='Wrong nr of staff lines';
%     return;
% end

%Get the number of bars
NrOfStaffLinesAreas = size(StaffLinesPos, 2)/NrOfStaffs;

%Remove staff liens and all note stems
NoteBW = RemoveVerticalLines(BW, 4);
NoteBW = RemoveHorizontalLines(NoteBW, 4);

%Calculate distance between staff lines, 5 at a time
StaffDist = LengthBetweenStaff(NrOfStaffLinesAreas, NrOfStaffs, StaffLinesPos);

%Load template
NoteHead = imread('Templetes/Notehead.jpg');

%Convert template into a black and white binary image
NoteHead = im2double(NoteHead);
NoteHead_Grey =rgb2gray(NoteHead);
NoteHead_BW = NoteHead_Grey < threshhold;
NoteHeadResize = imresize(NoteHead_BW, [StaffDist*2,StaffDist*2]); %*2 pga padding på template, själva nothuvudet är ca 6px

%Find correlation between template and image
Corr = normxcorr2(NoteHeadResize, NoteBW);

%Find the brighest spots in the image (Should be the note heads)
BrightestSpots = max(Corr(:));

%Threshold by a percentage of the brightest spots
Corr = Corr > (BrightestSpots*0.8); %0.8 känns inte säkert, får nog tweaka den siffran

%Label each note 
L = bwlabel(Corr);

%Get the center point of each object
positions = regionprops(L, 'centroid');

%Image of the correlation
imshow(Corr)

end

