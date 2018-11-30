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
NrOfStaffs =5;
Im = im2double(Im);
Im_Grey =rgb2gray(Im);
positions = FindNoteTemplate(Im_Grey);


NoteLetters = GetNoteLetter(Im_Grey, positions);
disp(NoteLetters(:, :)); %disp(NoteLetters(:, :)) för att visa alla i matrisen
%% Preprocess

%Detect papper 
%%Im = EdgeDetection(Im);

%Reduce blur


%Reduce rotation


%Reduce perspective


%Reduce noise



%% Detect
% Make the picture to Binary with all the text as white.
% threshhold = 0.9;
% level = graythresh(Im_Grey)
% BW1 = Im_Grey < threshhold;
% BW = Im_Grey<level;
% % imshow(BW1)
% % figure
% % imshow(BW)
% % figure
% 
% 
% %Detect staff lines
% StaffLinesPos = FindStaffLines(BW);
% % if(mod(size(StaffLinesPos, 2),5)~=0)
% %     strout ='Wrong nr of staff lines';
% %     return;
% % end
% NrOfStaffLinesAreas = size(StaffLinesPos, 2)/NrOfStaffs;
% 
% NoteBW = RemoveVerticalLines(BW, 4);
% NoteBW = RemoveHorizontalLines(NoteBW, 4);
% imshow(NoteBW)
% figure
% sum = 0;
% for i = 0:1:NrOfStaffLinesAreas-1
%     for j =1:1:NrOfStaffs-1
%         sum = sum + StaffLinesPos(1,i*NrOfStaffs+j+1) -StaffLinesPos(1,i*NrOfStaffs+j);      
%     end    
% end
% LengthBetweenStaff = round(sum/(NrOfStaffLinesAreas*(NrOfStaffs-1)))
% 
% NoteHead = imread('Templetes/Notehead.jpg');
% 
% NoteHead = im2double(NoteHead);
% NoteHead_Grey =rgb2gray(NoteHead);
% NoteHead_BW = NoteHead_Grey < threshhold;
% NoteHeadResize = imresize(NoteHead_BW, [LengthBetweenStaff,LengthBetweenStaff]);
% 
% Corr = normxcorr2(NoteHeadResize, NoteBW);
% 
% BrightestSpots = max(Corr(:))
% 
% Corr = Corr > (BrightestSpots*0.8);
% %bwlabel
% L = bwlabel(Corr);
% %regionprops centroid
% positions = regionprops(L, 'centroid');
% imshow(Corr)
% 
% disp("hej");





%Detect notes
% NoteBW = RemoveVerticalLines(BW, 4);
% NoteBW = RemoveHorizontalLines(NoteBW, 4);
%imshow(NoteBW);


%% Convert




strout = Im;
%%%%%%%%%%%%%%%%%%%%%%%%%%