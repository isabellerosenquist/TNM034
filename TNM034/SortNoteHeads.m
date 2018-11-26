function [Position] = SortNoteHeads(NoteHeadsPos,GKlausPos, StaffLinesPos, Length)
    Min = min(min(StaffLinesPos));   
    Top = Min-Length*5;

    %Get a vector from struct
    vect = cell2mat( struct2cell(GKlausPos(:,1)));
    %Make the vector to a matrix
    s = size(vect, 2);
    matXY = reshape (vect, [2,s/2])';
    
    %Make a mask 
    mask = matXY(:,2)>Top;
    
    %Avarage GKlaus position
    GklausMask = (matXY.*mask);
    AvarageGKlaus = sum(GklausMask(:,1))/sum(mask);    
    
    
    %Get a vector from struct
    vect = cell2mat( struct2cell(NoteHeadsPos(:,1)));
    s = size(vect, 2);
    %Make the vector to a matrix
    matXY = reshape (vect, [2,s/2])';
    
    % Mask for notehead
    NoteHeadMask = matXY(:,1) > (AvarageGKlaus+10);
    
    % Noteheads
    NoteHeads = (matXY.*NoteHeadMask);
    Position = NoteHeads;
end

