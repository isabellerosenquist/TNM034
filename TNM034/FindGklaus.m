function [Positions] = FindGklaus(BW, Top)

    % remove stafflines and other things
    NoLineBW = RemoveHorizontalLines(BW, 4);
    NoLineBW = RemoveVerticalLines(NoLineBW, 4);
    %Make a structural disk to close objects
    se = strel('disk',9);
    Gklaus = imclose(NoLineBW,se);
    % Make structural disk to open objects
    se = strel('disk',7);
    Gklaus = imopen(Gklaus,se);
    
    % Label things 
    Labels = bwlabel(Gklaus);
    %find de center of the objects
    Stats = regionprops(Labels, 'Centroid');
    
    
    %Make the struct to usable data
    vect = cell2mat( struct2cell(Stats(:,1)));
    %Make the vector to a matrix
    s = size(vect, 2);
    matXY = reshape (vect, [2,s/2])';
    
    
    
    imshow(Labels);
    %Make a mask 
    mask = matXY(:,2)>Top;
    
    %Avarage GKlaus position
    GklausMask = (matXY.*mask);
   
    
    
    AvarageGKlaus = sum(GklausMask(:,1))/sum(mask);    
    
    
    
    
    
    
    
    
    
    
    Positions = Stats;
end

