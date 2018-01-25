#Translation Transformation Matrix about Z-axis

function transZ=translationZ(d)
    transZ=[[1 0 0 0]; 
            [0 1 0 0]; 
            [0 0 1 d]; 
            [0 0 0 1]];
end
