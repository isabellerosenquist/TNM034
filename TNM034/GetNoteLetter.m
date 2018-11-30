function [ NoteLetters ] = GetNoteLetter(Im_Grey, positions )
% Summary of this function goes here

%String to store all letters found
NoteLetters = strings(size(positions, 1), 1);

%Set number of staff lines per bar and the threshold value for the BW image
NrOfStaffs =5;
thresh_percent = graythresh(Im_Grey);

BW = Im_Grey<thresh_percent;

%Detect staff lines
StaffLinesPos = FindStaffLines(BW, 0.6);

%Get number of bars
NrOfStaffLinesAreas = size(StaffLinesPos, 2)/NrOfStaffs;

%Get distance between bars
StaffDist = LengthBetweenStaff(NrOfStaffLinesAreas, NrOfStaffs, StaffLinesPos);

%Get a vector from struct
vect = cell2mat( struct2cell(positions(:,1)));
%Make the vector to a matrix
matXY = reshape(vect, [2,size(positions, 1)])';

%%Blir fel mellan StaffLinesPos och matXY, deras y positioner stämmer inte
%%med varandra
NrOfNotesFound = 0;
for i = 1:1:size(matXY, 1)
    for j = 1:1:size(StaffLinesPos, 2)
        
        if( (matXY(i, 2) - StaffLinesPos(1, j)) < -100)
            continue;
        end
        
        %Om noten ligger på en staffline
        %disp("Mat " + matXY(i, 2) + " Stafflines " + StaffLinesPos(1, j) + " Skillnad " + (matXY(i, 2) - StaffLinesPos(1, j))  + " StaffDist " + StaffDist/4 + " i " + i + " j " +j );
        if( abs( (matXY(i, 2)- StaffDist) - StaffLinesPos(1, j)) < StaffDist/4)
       
            if j == 1 || j == 6 || j == 11 || j == 16 || j == 21 ||j == 26 || j == 31 || j == 36
                NoteLetters(i) = "F2";
                NrOfNotesFound = NrOfNotesFound + 1;
                
                %disp("A    Mat " + (matXY(i, 2)) + " Stafflines " + StaffLinesPos(1, j) + " Skillnad " + (matXY(i, 2) - StaffLinesPos(1, j))  + " Not " + NoteLetters(i) + " i " + i + " j " +j );
            
            elseif j == 2 || j == 7 || j == 12 || j == 17 || j == 22 ||j == 27 || j == 32 || j == 37
                NoteLetters(i) = "D2";
                NrOfNotesFound = NrOfNotesFound + 1;
                
                %disp("A    Mat " + (matXY(i, 2)) + " Stafflines " + StaffLinesPos(1, j) + " Skillnad " + (matXY(i, 2) - StaffLinesPos(1, j))  + " Not " + NoteLetters(i) + " i " + i + " j " +j );
            
            elseif j == 3 || j == 8 || j == 13 || j == 18 || j == 23 ||j == 28 || j == 33 || j == 38
                NoteLetters(i) = "B1";
                NrOfNotesFound = NrOfNotesFound + 1;
                
                %disp("A    Mat " + (matXY(i, 2)) + " Stafflines " + StaffLinesPos(1, j) + " Skillnad " + (matXY(i, 2) - StaffLinesPos(1, j))  + " Not " + NoteLetters(i) + " i " + i + " j " +j );
            
            elseif j == 4 || j == 9 || j == 14 || j == 19 || j == 24 ||j == 29 || j == 34 || j == 39
                NoteLetters(i) = "G1";
                NrOfNotesFound = NrOfNotesFound + 1;
                
                %disp("A    Mat " + (matXY(i, 2)) + " Stafflines " + StaffLinesPos(1, j) + " Skillnad " + (matXY(i, 2) - StaffLinesPos(1, j))  + " Not " + NoteLetters(i) + " i " + i + " j " +j );
            
            elseif j == 5 || j == 10 || j == 15 || j == 20 ||j == 25 || j == 30 || j == 35 || j == 40
                NoteLetters(i) = "E1";
                NrOfNotesFound = NrOfNotesFound + 1;
                
                %disp("A    Mat " + (matXY(i, 2)) + " Stafflines " + StaffLinesPos(1, j) + " Skillnad " + (matXY(i, 2) - StaffLinesPos(1, j))  + " Not " + NoteLetters(i) + " i " + i + " j " +j );
            
            end 
            
        %Om noten ligger mellan 2 stafflines
        elseif(abs( (matXY(i, 2) - StaffDist) - (StaffLinesPos(1, j) + StaffDist/2)) < StaffDist/4)
            
            if j == 1 || j == 6 || j == 11 || j == 16 || j == 21 ||j == 26 || j == 31 || j == 36
                NoteLetters(i) = "E2";
                NrOfNotesFound = NrOfNotesFound + 1;

                %disp("B    Mat " + (matXY(i, 2)) + " Stafflines " + (StaffLinesPos(1, j) + StaffDist/2) + " Skillnad " + (matXY(i, 2) - StaffLinesPos(1, j))  + " Not " + NoteLetters(i) + " i " + i + " j " +j );

            elseif j == 2 || j == 7 || j == 12 || j == 17 || j == 22 ||j == 27 || j == 32 || j == 37
                NoteLetters(i) = "C1";
                NrOfNotesFound = NrOfNotesFound + 1;
                
                %disp("B    Mat " + (matXY(i, 2)) + " Stafflines " + (StaffLinesPos(1, j) + StaffDist/2) + " Skillnad " + (matXY(i, 2) - StaffLinesPos(1, j))  + " Not " + NoteLetters(i) + " i " + i + " j " +j );

            elseif j == 3 || j == 8 || j == 13 || j == 18 || j == 23 ||j == 28 || j == 33 || j == 38
                NoteLetters(i) = "A1";
                NrOfNotesFound = NrOfNotesFound + 1;
                                
                %disp("B    Mat " + (matXY(i, 2)) + " Stafflines " + (StaffLinesPos(1, j) + StaffDist/2) + " Skillnad " + (matXY(i, 2) - StaffLinesPos(1, j))  + " Not " + NoteLetters(i) + " i " + i + " j " +j );

            elseif j == 4 || j == 9 || j == 14 || j == 19 || j == 24 ||j == 29 || j == 34 || j == 39
                NoteLetters(i) = "F1";
                NrOfNotesFound = NrOfNotesFound + 1;
                                
                %disp("B    Mat " + (matXY(i, 2)) + " Stafflines " + (StaffLinesPos(1, j) + StaffDist/2) + " Skillnad " + (matXY(i, 2) - StaffLinesPos(1, j))  + " Not " + NoteLetters(i) + " i " + i + " j " +j );

            elseif j == 5 || j == 10 || j == 15 || j == 20 ||j == 25 || j == 30 || j == 35 || j == 40
                NoteLetters(i) = "D1";
                NrOfNotesFound = NrOfNotesFound + 1;
                                
                %disp("B    Mat " + (matXY(i, 2)) + " Stafflines " + (StaffLinesPos(1, j) + StaffDist/2) + " Skillnad " + (matXY(i, 2) - StaffLinesPos(1, j))  + " Not " + NoteLetters(i) + " i " + i + " j " +j );

            end 
        end
    end
end
disp("               ");
disp("***************");
disp("Number of notes found: " + NrOfNotesFound + "/" + (size(positions, 1) - 7));
disp("***************");
disp("               ");
end
