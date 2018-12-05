function [Position] = SortNoteHeads(NoteHeadsPos,StaffLinesPos, Length)
   
    %Set the positions of the different notes
    NotePositions = zeros(1,20);
    NotePositions(1,1) =StaffLinesPos(1,1)-Length*3;
    NotePositions(1,2) =StaffLinesPos(1,1)-Length*3+Length/2;
    NotePositions(1,3) =StaffLinesPos(1,1)-Length*2;
    NotePositions(1,4) =StaffLinesPos(1,1)-Length*2+Length/2;
    NotePositions(1,5) =StaffLinesPos(1,1)-Length*1;
    NotePositions(1,6) =StaffLinesPos(1,1)-Length*1+Length/2;
    NotePositions(1,7) =StaffLinesPos(1,1);
    NotePositions(1,8) =StaffLinesPos(1,1)+Length/2;
    NotePositions(1,9) =StaffLinesPos(1,2);
    NotePositions(1,10) =StaffLinesPos(1,2)+Length/2;
    NotePositions(1,11) =StaffLinesPos(1,3);
    NotePositions(1,12) =StaffLinesPos(1,3)+Length/2;
    NotePositions(1,13) =StaffLinesPos(1,4);
    NotePositions(1,14) =StaffLinesPos(1,4)+Length/2;
    NotePositions(1,15) =StaffLinesPos(1,5);
    NotePositions(1,16) =StaffLinesPos(1,5)+Length/2;
    NotePositions(1,17) =StaffLinesPos(1,5)+Length*1;
    NotePositions(1,18) =StaffLinesPos(1,5)+Length*1+Length/2;
    NotePositions(1,19) =StaffLinesPos(1,5)+Length*2;
    NotePositions(1,20) =StaffLinesPos(1,5)+Length*2+Length/2;
    
   %A find min function that find which Noteposition that the note lies
   %closest to
   best = zeros(size(NoteHeadsPos,1),1);
   for i = 1:1:size(NoteHeadsPos,1)      
       min =10000;
       for j = 1:1:20
           if( abs(NotePositions(1,j)-NoteHeadsPos(i,2))< min)
              min =  abs(NotePositions(1,j)-NoteHeadsPos(i,2));
              best(i,1) =j; 
           end          
       end   
   end
   %Preallocate a string array for each note
   chr = strings(1,size(NoteHeadsPos,1)+1);
   %Depending on the number i the previous find min function we give
   %translate the position into a note
   for i = 1:1:size(NoteHeadsPos,1)
       switch best(i,1)
           case 1
              chr(1,i)  = 'E4';           
           case 2
              chr(1,i)  = 'D4';      
           case 3
              chr(1,i)  = 'C4';             
           case 4
              chr(1,i)  = 'B3';    
           case 5
              chr(1,i)  = 'A3';        
           case 6
              chr(1,i)  = 'G3';           
           case 7
              chr(1,i)  = 'F3';
           case 8
               chr(1,i)  = 'E3';     
           case 9
              chr(1,i)  = 'D3';          
           case 10
              chr(1,i)  = 'C3';       
           case 11
              chr(1,i)  = 'B2';
           case 12
              chr(1,i)  = 'A2';   
           case 13
              chr(1,i)  = 'G2';
           case 14
              chr(1,i)  = 'F2';               
           case 15
              chr(1,i)  = 'E2';  
           case 16
              chr(1,i)  = 'D2'; 
           case 17
              chr(1,i)  = 'C2'; 
           case 18
              chr(1,i)  = 'B1';    
           case 19
              chr(1,i)  = 'A1';    
           case 20
              chr(1,i)  = 'G1';
       end
   end
   %Set a break line at the end
   chr(1,size(chr,2)) = 'n';
   Position = chr;
end

