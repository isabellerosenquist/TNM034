function [Ans] = Flags(NotePos, Staffline, BW)
    ImageBW = RemoveHorizontalLines(BW,4);
    %imshow(ImageBW)
    Xpos = round(NotePos(1,1));
    Ypos = round(NotePos(1,2));
    if(Staffline <=12)      
        SmallBW = ImageBW(Ypos+10:Ypos+20, Xpos-10:Xpos+15);
        imshow(SmallBW);
            
    else
        SmallBW = ImageBW(Ypos-20:Ypos-10, Xpos-10:Xpos+15);
        imshow(SmallBW);    
    end
    
    Pixelsum = sum(SmallBW);
    %[r, c] = size(SmallBW');
    %plot(1:1:r, Pixelsum)
    [pks, locs] = findpeaks(Pixelsum);

    if(size(locs,2)==2)
        Ans = 1;
        
    else
        Ans = 0;
    end
end

