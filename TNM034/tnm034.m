%%%%%%%%%%%%%%%%%%%%%%%%%%
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

%Detect papper 
%%Im = EdgeDetection(Im);

%Reduce blur


%Reduce rotation


%Reduce perspective


%Reduce noise



%% Detect
% Make the picture to Binary with all the text as white.
threshhold = 0.9;
BW = Im_Grey<threshhold;

%Detect staff lines
StaffLinesPos = FindStaffLines(BW);
NrOfStaffLinesAreas = size(StaffLinesPos, 2)/5

%Detect notes
%NoteBW = RemoveVerticalLines(BW, 5);
NoteBW = RemoveHorizontalLines(BW, 5);
imshow(BW);


%% Convert




strout = Im;
%%%%%%%%%%%%%%%%%%%%%%%%%%