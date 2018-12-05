function [Length, Areas] = LenghtBetweenStaffLines(StaffLinesPos)
    %This Function gets the avarage length between all the staff line and
    %the number of staff areas.

    %The number of staff in each areas which always is 5.
    NrOfStaffs =5;
    %The number of staff areas which is the number of found stafflines
    %divided by 5.
    Areas = size(StaffLinesPos, 2)/NrOfStaffs;
    
    % The loop will sum the pixel length between all staff lines in a area
    % and then divid it on the number of stafflines
    sum = 0;
    for i = 0:1:Areas-1
        for j =1:1:NrOfStaffs-1
            sum = sum + StaffLinesPos(1,i*NrOfStaffs+j+1) -StaffLinesPos(1,i*NrOfStaffs+j);      
        end    
    end
    Length = round(sum/(Areas*(NrOfStaffs-1)));
end

