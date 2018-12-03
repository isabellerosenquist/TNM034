function [Positions] = FindNoteHeads(BW, Gklaus)
    Limit = round(Gklaus(1,1)+10);
    BW(:,1:Limit) =0; 
    %Remove horizontal and vertical lines
    NoLineBW = RemoveHorizontalLines(BW, 4);
    imshow(NoLineBW);
    NoLineBW = RemoveVerticalLines(NoLineBW, 4);
    imshow(NoLineBW);
    
    %Remove smal objects
    se = strel('rectangle',[2 20]);
   
    Lines = imopen(NoLineBW,se);
    Lines = ~Lines;
    
    
    
    NoBeam = NoLineBW.*Lines;
    
    imshow(NoBeam);
    se = strel('sphere',4);
 
    
    Noteheads = imopen(NoBeam,se);
    
    imshow(Noteheads);
    Labels = bwlabel(Noteheads);
    imshow(Labels);
    Stats = regionprops(Labels, 'Centroid');
    Mat = StructToMat(Stats);
    Positions = Mat;
end

