function strout = tnm034(Im)
%
% Im: Input image of captured sheet music. Im should be in
% double format, normalized to the interval [0,1]
%
% strout: The resulting character string of the detected notes.
% The string must follow the pre-defined format, explained below.
%
% Your program code…

Im = im2double(Im);
Im_Grey =rgb2gray(Im);

%% Preprocess
%Make a Binary image
% Make the picture to Binary with all the text as white.
level = graythresh(Im_Grey);
BW = Im_Grey<level;
%Detect papper 


%Reduce blur


%Reduce rotation


%Reduce perspective


%Reduce noise



%% Detect

%Rotate the picture depending on the angle from hough transform
RotateBW = MyHough(BW);

%Detect staff lines
Staff = FindStaffLines(RotateBW, 0.4);
[Length,NumberOfStaffAreas]  = LenghtBetweenStaffLines(Staff); 

%Divide the picture into staffareas
StaffAreas = DividedIntoStaffAreas(RotateBW, Staff, Length, NumberOfStaffAreas);
ResizedStaffAreas = imresize(StaffAreas,10/Length);

%Get the own made structural element
str = imread('Templetes/im6s.jpg');
str = imresize(str, [7,7]);
str = im2double(str);
str =rgb2gray(str);
threshhold = graythresh(str);
str = str<threshhold;
% 
%  for i = 1:1:NumberOfStaffAreas
%      figure;
%      imshow(ResizedStaffAreas(:,:,i));
%  end
out = '';
 for i = 1:1:NumberOfStaffAreas
      Staff = FindStaffLines(ResizedStaffAreas(:,:,i),0.4);
      Length = LenghtBetweenStaffLines(Staff);
      GKlaus = FindGklaus(ResizedStaffAreas(:,:,i));
      NoteHeads = FindNoteHeads(ResizedStaffAreas(:,:,i), GKlaus, str);   
      String = SortNoteHeads(NoteHeads, Staff, Length, ResizedStaffAreas(:,:,i));
      out = strcat(out, join(String));
 end

strout = out;