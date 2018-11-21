function [Positions] = FindGklaus(BW)

    NoLineBW = RemoveHorizontalLines(BW, 4);
    NoLineBW = RemoveVerticalLines(NoLineBW, 4);
    se = strel('disk',8);
    Gklaus = imclose(NoLineBW,se);
    se = strel('disk',8);
    Gklaus = imopen(Gklaus,se);
    
     Labels = bwlabel(Gklaus);
    Stats = regionprops(Labels, 'Centroid');
    
    Position = Stats;
end

