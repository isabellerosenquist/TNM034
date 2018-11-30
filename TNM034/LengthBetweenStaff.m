function [ Length ] = LengthBetweenStaff( NrOfStaffLinesAreas, NrOfStaffs, StaffLinesPos )
%LENGTHBETWEENSTAFF Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
for i = 0:1:NrOfStaffLinesAreas-1
    for j =1:1:NrOfStaffs-1
        sum = sum + StaffLinesPos(1,i*NrOfStaffs+j+1) -StaffLinesPos(1,i*NrOfStaffs+j);      
    end    
end
Length = round(sum/(NrOfStaffLinesAreas*(NrOfStaffs-1)));

end

