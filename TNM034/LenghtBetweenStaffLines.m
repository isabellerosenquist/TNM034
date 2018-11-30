function [Length, Areas] = LenghtBetweenStaffLines(StaffLinesPos)
    NrOfStaffs =5;
    Areas = size(StaffLinesPos, 2)/NrOfStaffs;
    sum = 0;
    for i = 0:1:Areas-1
        for j =1:1:NrOfStaffs-1
            sum = sum + StaffLinesPos(1,i*NrOfStaffs+j+1) -StaffLinesPos(1,i*NrOfStaffs+j);      
        end    
    end
    Length = round(sum/(Areas*(NrOfStaffs-1)));
end

