function [Positions] = FindGklaus(BW)

    % remove stafflines and other things
    NoLineBW = RemoveHorizontalLines(BW, 4);
    NoLineBW = RemoveVerticalLines(NoLineBW, 4);
    %Make a structural disk to close objects
    se = strel('disk',8);
    Gklaus = imclose(NoLineBW,se);
    % Make structural disk to open objects
    se = strel('disk',8);
    Gklaus = imopen(Gklaus,se);
    
    imshow(Gklaus)
    % Label things 
    Labels = bwlabel(Gklaus);
    %find de center of the objects
    Stats = regionprops(Labels, 'Centroid');
    Positions = Stats;
end

