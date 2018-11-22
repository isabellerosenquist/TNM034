function [Position] = SortNoteHeads(NoteHeadsPos,GKlausPos, StaffLinesPos, Length)
    Min = min(min(StaffLinesPos));   
    Top = Min-Length*5;
    t = zeros(size(GKlausPos));
    t = GKlausPos(:,1).Centroid(1,2);
    
    A = BW>0.5;
    
    
    Position = 0;
end

