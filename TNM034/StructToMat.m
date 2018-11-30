function [Mat] = StructToMat(Struct)
    


    %Make the struct to usable data
    vect = cell2mat( struct2cell(Struct(:,1)));
    %Make the vector to a matrix
    s = size(vect, 2);
    Mat = reshape (vect, [2,s/2])';
end

