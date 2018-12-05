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
%positions = FindNoteTemplate(Im_Grey);


%NoteLetters = GetNoteLetter(Im_Grey, positions);
%disp("Notes: ");
%disp(NoteLetters(:, 1)'); %disp(NoteLetters(:, :)) för att visa alla i matrisen
%% Preprocess
%Make a Binary image
% Make the picture to Binary with all the text as white.
level = graythresh(Im_Grey);
BW = Im_Grey<level;
%Detect papper 
%%Im = EdgeDetection(Im);

%Reduce blur


%Reduce rotation


%Reduce perspective


%Reduce noise



%% Detect

%Rotate the picture depending on the angle from hough transform
RotateBW = OldHough(BW,BW);



%Detect staff lines
Staff = FindStaffLines(RotateBW, 0.4);
[Length,NumberOfStaffAreas]  = LenghtBetweenStaffLines(Staff); 



%Divide the picture into staffareas
StaffAreas = DividedIntoStaffAreas(BW, Staff, Length, NumberOfStaffAreas);
ResizedStaffAreas = imresize(StaffAreas,10/Length);

%Get the own made structural element
str = imread('Templetes/im6s.jpg');
str = imresize(str, [7,7]);
str = im2double(str);
str =rgb2gray(str);
threshhold = graythresh(str);
str = str<threshhold;

out = '';
 for i = 1:1:NumberOfStaffAreas
      Staff = FindStaffLines(ResizedStaffAreas(:,:,i),0.6);
      Length = LenghtBetweenStaffLines(Staff);
      GKlaus = FindGklaus(ResizedStaffAreas(:,:,i));
      NoteHeads = FindNoteHeads(ResizedStaffAreas(:,:,i), GKlaus, str);   
      String = SortNoteHeads(NoteHeads, Staff, Length);
      out = strcat(out, join(String));
 end

strout = out;