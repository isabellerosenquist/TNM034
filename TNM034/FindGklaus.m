function [Position] = FindGklaus(BW)
    %Find the approximate GKlaus position. It removes as much of the noise
    %it can and the just return the first object from the left. In the most
    %cases it return the Gklaus but in som cases it returns something else
    %but it always lies in the approximate position of the gklaus.


    % remove stafflines and other things
    NoLineBW = RemoveHorizontalLines(BW, 4);
    NoLineBW = RemoveVerticalLines(NoLineBW, 4);

    %Make a structural disk to close objects
    se = strel('disk',8);
    Gklaus = imclose(NoLineBW,se);
    
    %Put a label on things
    Labels = bwlabel(Gklaus);
    
    %find de center of the objects
    Stats = regionprops(Labels, 'Centroid');
   
    % Make the struct to a matrix
    matXY = StructToMat(Stats);
    
    %Return the first position because the Gklaus i almost always first
    Position = matXY(1,:);
end

