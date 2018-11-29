%Main
Image = imread('Images_Training/im3s.jpg');
Im = im2double(Image);
Im_grey =rgb2gray(Im);
threshhold = 0.9;
BW = Im_grey<threshhold;

imshow(BW)
NoteHead = FindNoteHeads(BW);
GKlaus = FindGklaus(BW);
Staff = FindStaffLines(BW);
Length = LenghtBetweenStaffLines(Staff);
pos = SortNoteHeads(NoteHead,GKlaus, Staff, Length);

imshow(Image);

%ans = tnm034(Im);