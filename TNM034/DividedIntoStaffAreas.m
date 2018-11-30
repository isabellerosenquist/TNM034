function [StaffAreas] = DividedIntoStaffAreas(BW, StaffLines, Length)

    %Calculate number of staff areas
    NumberOfStaffs = size(StaffLines, 2)/5.0;
    
    %Loop through all staff areas
    for i = 0:1:NumberOfStaffs-1
        % Get the lowest pixel that the note won't be on
        LowLimit = StaffLines(1, 1+i*5)-Length*4;
        HighLimit = LowLimit + 12*Length;
        %Acess only the part that include the staffarea
        Areas(:,:,i+1) =BW(LowLimit:HighLimit,:);       
    end
    StaffAreas = Areas;
end

