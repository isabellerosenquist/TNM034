function [StaffAreas] = DividedIntoStaffAreas(BW, StaffLines, Length, NumberOfStaffsAreas)
    % Takes in the whole image and divide it into smaller images with just
    % one staffarea in each.
    %Loop through all staff areas
    for i = 0:1:NumberOfStaffsAreas-1
        % Get the lowest pixel that the note won't be on
        LowLimit = StaffLines(1, 1+i*5)-Length*3;
        HighLimit = LowLimit + 10*Length;
        %Acess only the part that include the staffarea
        Areas(:,:,i+1) =BW(LowLimit:HighLimit,:);       
    end
    %Return the different staff areas
    StaffAreas = Areas;
end

