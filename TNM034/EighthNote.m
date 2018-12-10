function [Ans] = EighthNote(NotePos, Staffline, BW)
    BW = padarray(BW,[3,0]);
    ImageBW = RemoveHorizontalLines(BW,4);
    ImageBW = RemoveVerticalLines(ImageBW,4);
    imshow(ImageBW)
%     Xpos = round(NotePos(1,1));
%     Ypos = round(NotePos(1,2));
%     Ymax = size(BW, 1);
%     if(Staffline <=12)      
%         SmallBW = ImageBW(Ypos+10:Ymax, Xpos+10:Xpos+15);
%         imshow(SmallBW);
%             
%     else
%         SmallBW = ImageBW(1:Ypos-10, Xpos+10:Xpos+15);
%         imshow(SmallBW);    
%     end
    
    Xpos = round((NotePos(1,1)+NotePos(2,1))/2);
    %Ypos = round((NotePos(1,2)+NotePos(2,2))/2);
    %Ymax = size(BW, 1);
     
    SmallBW = ImageBW(:, Xpos-1:Xpos+1);
    imshow(SmallBW);

    
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

