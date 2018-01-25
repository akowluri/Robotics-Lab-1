function rotateZ=rotationZ(t)
    rotateZ=[[cos(t) -sin(t) 0 0];
              [sin(t) cos(t) 0 0]; 
                        [0 0 1 0];
                        [0 0 0 1]];
end