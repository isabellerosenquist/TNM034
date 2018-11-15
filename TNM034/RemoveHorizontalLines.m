function [Output] = RemoveHorizontalLines(BW, Size )
    
    se = true(Size,1);
    Output = imopen(BW, se);
end

