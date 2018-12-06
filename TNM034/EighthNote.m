function [Ans] = EighthNote(NotePos, Staffline, BW)
    ImageBW = RemoveHorizontalLines(BW,4);
    imshow(ImageBW)
    Xpos = round(NotePos(1,1));
    Ypos = round(NotePos(1,2));
    Ymax = size(BW, 1);
    if(Staffline <=12)      
        SmallBW = ImageBW(Ypos+10:Ymax, Xpos+10:Xpos+15);
        imshow(SmallBW);
            
    else
        SmallBW = ImageBW(0:Ypos-10, Xpos+10:Xpos+15);
        imshow(SmallBW);    
    end
    
    Pixelsum = sum(SmallBW');
    %[r, c] = size(SmallBW');
    %plot(1:1:r, Pixelsum)
    [pks, locs] = findpeaks(Pixelsum);

    if(size(locs,2)== 0)
        Ans = 0;
    elseif(size(locs, 2) == 1)
        Ans = 1;
    else
        Ans = 2;
    end
end

