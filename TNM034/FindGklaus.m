function [Position] = FindGklaus(BW)

    % remove stafflines and other things
    NoLineBW = RemoveHorizontalLines(BW, 4);
    NoLineBW = RemoveVerticalLines(NoLineBW, 4);
    %Make a structural disk to close objects
    se = strel('disk',9);
    Gklaus = imclose(NoLineBW,se);
    imshow(Gklaus);
    % Make structural disk to open objects
    se = strel('disk',9);
    Gklaus = imopen(Gklaus,se);
    imshow(Gklaus);
    % Label things 
    Labels = bwlabel(Gklaus);
    %find de center of the objects
    Stats = regionprops(Labels, 'Centroid');
   
    matXY = StructToMat(Stats);
    
    
    imshow(Labels);
    
    
    Position = matXY(1,:);
end

