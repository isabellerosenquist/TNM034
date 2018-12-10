function [Ans] = EighthNote(NotePos, BW)
    %This function checks if there are a lines between two notes 
    
    
    %Set a padding at the top and bottom get a better performance from
    %findpeaks
    BW = padarray(BW,[3,0]);
    
    %Take away unnecessary elements in the image.
    ImageBW = RemoveHorizontalLines(BW,4);
    ImageBW = RemoveVerticalLines(ImageBW,4);
    se = strel('sphere',1);
    ImageBW = imopen(ImageBW,se);

    %If the notes are far away from eachother, return 0. Needs more
    %tweaking
    if(NotePos(2,1)-NotePos(1,1)>70)
        Ans = 0;
        return;
    end
    %Get the Center value between notes
    Xpos = round((NotePos(1,1)+NotePos(2,1))/2);

     %Take out the part of the image we want
    SmallBW = ImageBW(:, Xpos-1:Xpos+1);
    
    %Sum the values and find peaks
    Pixelsum = sum(SmallBW,2);
    [~, locs] = findpeaks(Pixelsum);

    %Return a value depending on peaks, 0 peaks = quarter notes, 1 peak =
    %Eight note and 2 peaks = sixtingth notes
    if(size(locs,1)== 0)
        Ans = 0;
    elseif(size(locs, 1) == 1)
        Ans = 1;
    else
        Ans = 2;
    end
end

