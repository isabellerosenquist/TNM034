function [ ReturnInt ] = FindEighthNotes(BW, NotePos1, NotePos2, GKlaus)
%FINDEIGHTHNOTES Summary of this function goes here
%   Detailed explanation goes here





Padding = 10;
ReturnInt = 0;

%Remove the Gklaus
Limit = round(GKlaus(1,1)+10);
BW(:,1:Limit) = 0; 

%Remove the horizontal lineas
NoLineBW = RemoveHorizontalLines(BW, 3);
NoLineBW = RemoveVerticalLines(NoLineBW, 4);

imshow(NoLineBW);
figure
%Get the low limit
LowLimit = NotePos1(1)-Padding;

%Distance between the first and the next notehead
XSize = NotePos2(1) - NotePos1(1);

%Get the second notehead
HighLimit = LowLimit + XSize + Padding*2;

%Om man bara vill se linjen och inte nothuvudet
YHighLimit = 0;
if(NotePos1(1, 2) < NotePos2(1, 2))
    YHighLimit = NotePos2(1, 2) + Padding;
else
    YHighLimit = NotePos1(1, 2) + Padding;
end
disp(YHighLimit);

YLowLimit = size(NoLineBW, 1);

NoteImage(:,:) = NoLineBW(YHighLimit:YLowLimit,LowLimit:HighLimit);  
NoteImage = imresize(NoteImage, 4);
NoteImage = bwmorph(NoteImage, 'thin', 100);
%Rotate image so all lines get horizontal
imshow(NoteImage);
NoteImage = MyHough(NoteImage);

%Horizontal projection
Pixelsum = sum(NoteImage,2);
[r, c] = size(NoteImage);
    plot(1:1:r, Pixelsum)
    figure

maxValue = max(Pixelsum);
NumberOfLines = 0;   

%Find all peaks and their location
[pks, ~] = findpeaks(Pixelsum);

[~, cp] = size(pks);

for j =1:1:cp
    %If the peaks are in 
    if(pks(1,j) >maxValue*0.8)
        NumberOfLines = NumberOfLines +1;            
    end  
end

%disp(NumberOfLines);

if(NumberOfLines == 0)
    ReturnInt = 0;
elseif(NumberOfLines == 1)
    ReturnInt = 1;
else
    ReturnInt = 2;
end
figure
imshow(NoteImage);


