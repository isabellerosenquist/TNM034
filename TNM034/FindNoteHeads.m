function [Positions] = FindNoteHeads(BW)
    %Remove horizontal and vertical lines
    NoLineBW = RemoveHorizontalLines(BW, 4);
    NoLineBW = RemoveVerticalLines(NoLineBW, 4);
    
    %Remove smal objects
    se = strel('disk',4);
    Noteheads = imopen(NoLineBW,se);
    Labels = bwlabel(Noteheads);
    Stats = regionprops(Labels, 'Centroid');
    Positions = Stats;
end

