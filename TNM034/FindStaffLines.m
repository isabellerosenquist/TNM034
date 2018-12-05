function [PixelCoord] = FindStaffLines(BW, percent)

    %Sum all horizontal pixels
    Pixelsum = sum(BW');
    [r, c] = size(BW);
    %plot(1:1:r, Pixelsum)
%     figure
    
    maxValue = max(Pixelsum);
    count = 1;   
    
    %Find all peaks and their location
    [pks, locs] = findpeaks(Pixelsum);
    [~, cp] = size(pks);
    for i =1:1:cp
        %IF the peaks value is in a close proximinity add it to our return
        %variable
        if(pks(1,i) >maxValue*percent)
            PixelCoord(1,count)= locs(1, i);
            count = count +1;            
        end  
    end
end

