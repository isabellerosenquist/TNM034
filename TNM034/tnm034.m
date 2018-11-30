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
%%Im = EdgeDetection(Im);

%Reduce blur


%Reduce rotation


%Reduce perspective


%Reduce noise



%% Detect

%Rotate the picture depending on the angle from hough transform
RotateBW = BW;



%Detect staff lines
Staff = FindStaffLines(RotateBW);
Length = LenghtBetweenStaffLines(Staff); 
if(mod(size(Staff, 2),5)~=0)
    strout ='Wrong nr of staff lines';
    return;
end



%Divide the picture into staffareas
StaffAreas = DividedIntoStaffAreas(BW,Staff, Length);

%  for i = 1:1:size(Staff,2)/5
%        figure
%        imshow(StaffAreas(:,:,i));      
%  end



%Detect notes

%imshow(NoteBW);


%% Convert




strout = Im;