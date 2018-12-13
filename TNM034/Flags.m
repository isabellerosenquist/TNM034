function [Ans] = Flags(NotePos, Staffline, BW)
    ImageBW = RemoveHorizontalLines(BW,4);
    imshow(ImageBW)
    Xpos = round(NotePos(1,1));
    Ypos = round(NotePos(1,2));
    if(Staffline <=12)      
        SmallBW = ImageBW(Ypos+15:Ypos+25, Xpos-10:Xpos+10);
        imshow(SmallBW);
            
    else
        SmallBW = ImageBW(Ypos-25:Ypos-15, Xpos-10:Xpos+10);
        imshow(SmallBW);    
    end
    
    Pixelsum = sum(SmallBW);
    [r, c] = size(SmallBW');
    plot(1:1:r, Pixelsum)
    [pks, locs] = findpeaks(Pixelsum);

    if(size(locs,2)==2)
        Ans = 1;
        
    else
        Ans = 0;
    end
end

