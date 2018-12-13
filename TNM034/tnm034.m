function strout = tnm034(Im)
%
% Im: Input image of captured sheet music. Im should be in
% double format, normalized to the interval [0,1]
%
% strout: The resulting character string of the detected notes.
% The string must follow the pre-defined format, explained below.
%
% Your program code…

%% Make image into binary

%Make sure that the image is in greyscale and in double precision values
Im = im2double(Im);
Im_Grey =rgb2gray(Im);

% Make the picture to Binary with all the text as white.
level = graythresh(Im_Grey);
BW = Im_Grey<level;

%% Preprocess



%% Detect Notes

%Rotate the picture depending on the angle from hough transform
RotateBW = MyHough(BW);

%Detect staff lines and get length between staffs and the number of staff
%areas
Staff = FindStaffLines(RotateBW, 0.4);
[Length,NumberOfStaffAreas]  = LenghtBetweenStaffLines(Staff);

%Divide the picture so each image contains one staff area. Then resize the
%image so it is always 10 pixels between staff lines
StaffAreas = DividedIntoStaffAreas(RotateBW, Staff, Length, NumberOfStaffAreas);
ResizedStaffAreas = imresize(StaffAreas,10/Length);

%Get the own made structural element
str = imread('Templetes/im6s.jpg');
str = imresize(str, [7,7]);
str = rgb2gray(im2double(str));
threshhold = graythresh(str);
str = str<threshhold;


%  for i = 1:1:NumberOfStaffAreas
%      figure;
%      imshow(ResizedStaffAreas(:,:,i));
%  end

%Inital character array
out = '';

%Loop through all staffa areas
for i = 1:1:NumberOfStaffAreas
    %Get the positions of the new stafflines and the length
    Staff = FindStaffLines(ResizedStaffAreas(:,:,i),0.4);
    Length = LenghtBetweenStaffLines(Staff);
    %The approximate position of the Gklaus
    GKlaus = FindGklaus(ResizedStaffAreas(:,:,i));
    %Get all the note positions
    NoteHeads = FindNoteHeads(ResizedStaffAreas(:,:,i), GKlaus, str);
    %Classification
    String = SortNoteHeads(NoteHeads, Staff, Length, ResizedStaffAreas(:,:,i));
    out = strcat(out, join(String));
end

strout = out;