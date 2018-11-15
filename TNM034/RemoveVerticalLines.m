function [Output] = RemoveVerticalLines(BW, Size)
    
    se = true(1,Size);
    Output = imopen(BW, se);
end

