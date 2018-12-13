function [Positions] = FindNoteHeads(BW, Gklaus, str)
    %This function find the positions of the note heads.
    imshow(BW);
    %Removes everyting to the left of the Gklaus and 20 pixels to the
    %right.
    Limit = round(Gklaus(1,1)+20);
    BW(:,1:Limit) =0; 
    NoteHeads = BW;
    
    %Remove horizontal and vertical lines
    NoteHeads = RemoveHorizontalLines(NoteHeads, 4);
    NoteHeads = RemoveVerticalLines(NoteHeads, 6);

    %remove horizontal object
    se = strel('rectangle',[2 15]);
    Lines = imopen(NoteHeads,se);
    NoteHeads = NoteHeads.*(~Lines);
    
    %remove Vertical object
    se = strel('rectangle',[15 2]);
    Lines = imopen(NoteHeads,se);
    NoteHeads = NoteHeads.*(~Lines);
    
    % Removes objects that doesn't fits into our note structural object    
    se = strel('arbitrary',str);
    NoteHeads = imopen(NoteHeads,se);
   
    %Remove som small noise that is left
    se = strel('sphere',3);
    NoteHeads = imopen(NoteHeads,se);

    %Label and run regionprops on the image
    Labels = bwlabel(NoteHeads);
    %imshow(Labels);
    Stats = regionprops(Labels, 'Centroid');
    imshow(Labels);
    %Make the struct into a matrix
    Mat = StructToMat(Stats);
    Positions = Mat;
end

