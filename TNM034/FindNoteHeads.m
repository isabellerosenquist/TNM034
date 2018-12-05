function [Positions] = FindNoteHeads(BW, Gklaus)
    Image = imread('Templetes/im6s.jpg');
    Image = imresize(Image, [7,7]);
    Im = im2double(Image);
    Im_grey =rgb2gray(Im);
    threshhold = graythresh(Im_grey);
    note = Im_grey<threshhold;
    






    Limit = round(Gklaus(1,1)+20);
    BW(:,1:Limit) =0; 
    %Remove horizontal and vertical lines
    NoLineBW = RemoveHorizontalLines(BW, 4);
    imshow(NoLineBW);
    NoLineBW = RemoveVerticalLines(NoLineBW, 6);
    imshow(NoLineBW);
    

    %remove horizontal object
    se = strel('rectangle',[2 15]);
    Lines = imopen(NoLineBW,se);
    Lines = ~Lines;
    NoBeam = NoLineBW.*Lines;
    
     %remove horizontal object
    se = strel('rectangle',[15 2]);
    Lines = imopen(NoBeam,se);
    Lines = ~Lines;
    NoBeam = NoBeam.*Lines;
    
   
    
    
    imshow(NoBeam);
    
        
    se = strel('arbitrary',note);
    Noteheads = imopen(NoBeam,se);
    imshow(Noteheads);
    

   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    se = strel('sphere',3);
    Noteheads = imopen(Noteheads,se);
%     
%     imshow(Noteheads);
    Labels = bwlabel(Noteheads);
    imshow(Labels);
    Stats = regionprops(Labels, 'Centroid');
    Mat = StructToMat(Stats);
    Positions = Mat;
end

