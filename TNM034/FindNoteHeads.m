function [Positions] = FindNoteHeads(BW, Gklaus)
    Limit = round(Gklaus(1,1)+10);
    BW(:,1:Limit) =0; 
    %Remove horizontal and vertical lines
    NoLineBW = RemoveHorizontalLines(BW, 6);
    %imshow(NoLineBW);
    NoLineBW = RemoveVerticalLines(NoLineBW, 6);
    %imshow(NoLineBW);
    
    %Remove smal objects
    se = strel('disk',5);
   
    Noteheads = imopen(NoLineBW,se);
    
    %imshow(Noteheads);
    Labels = bwlabel(Noteheads);
    %imshow(Labels);
    Stats = regionprops(Labels, 'Centroid');
    Mat = StructToMat(Stats);
    Positions = Mat;
end

