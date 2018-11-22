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
if(mod(size(StaffLinesPos, 2),5)~=0)
    strout ='Wrong nr of staff lines';
    return;
end
NrOfStaffLinesAreas = size(StaffLinesPos, 2)/NrOfStaffs;
sum = 0;
for i = 0:1:NrOfStaffLinesAreas-1
    for j =1:1:NrOfStaffs-1
        sum = sum + StaffLinesPos(1,i*NrOfStaffs+j+1) -StaffLinesPos(1,i*NrOfStaffs+j);      
    end    
end
LengthBetweenStaff = round(sum/(NrOfStaffLinesAreas*(NrOfStaffs-1)))


%NoteHead = imread('Templetes/NoteHead.jpg');

%NoteHeadResize = imresize(NoteHead, [LengthBetweenStaff,LengthBetweenStaff]);
%imshow(NoteHeadResize)
%figure
%C = normxcorr2(NoteHead, Im);
%C = C>0.9;
%imshow(C)







%Detect notes
NoteBW = RemoveVerticalLines(BW, 4);
NoteBW = RemoveHorizontalLines(NoteBW, 4);
%imshow(NoteBW);


%% Convert




strout = Im;
%%%%%%%%%%%%%%%%%%%%%%%%%%