# Rotation Transformation Matrix about X-axis

function rotateX = rotationX(alpha)
    rotateX=                  [[1 0 0 0];
            [0 cos(alpha) -sin(alpha) 0];
             [0 sin(alpha) cos(alpha) 0];
                              [0 0 0 1]];
end


