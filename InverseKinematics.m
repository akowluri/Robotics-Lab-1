#Inverse Kinematics Transformation to desired End Effector Position

function IK = InverseKinematics(theta, point, goal, step)
    q0 = theta;
    t1 = q0(1);t2 = q0(2);
    x0 = ForwardKinematics(q0)*point;
    xd = goal;
    dx = (xd - x0)./step;
    while norm(dx) > 10^(-3)
        #This Jacobian inverse was calculated using dummy variables to mathematically determine the inverse Jacobian with respect to theta
        inversejacob = [ - ((20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2))*(30*cos(t1) + 20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2)) + (20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1))*(30*sin(t1) + 20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1)))*(20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1)) - ((30*cos(t1) + 20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2))^2 + (30*sin(t1) + 20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1))^2)*(30*sin(t1) + 20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1)), ((30*cos(t1) + 20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2))^2 + (30*sin(t1) + 20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1))^2)*(30*cos(t1) + 20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2)) + ((20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2))*(30*cos(t1) + 20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2)) + (20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1))*(30*sin(t1) + 20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1)))*(20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2)), 0, 0;...
                           - ((20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2))*(30*cos(t1) + 20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2)) + (20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1))*(30*sin(t1) + 20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1)))*(30*sin(t1) + 20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1)) - ((20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2))^2 + (20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1))^2)*(20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1)),                           ((20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2))*(30*cos(t1) + 20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2)) + (20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1))*(30*sin(t1) + 20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1)))*(30*cos(t1) + 20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2)) + ((20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2))^2 + (20*cos(t1)*sin(t2) + 20*cos(t2)*sin(t1))^2)*(20*cos(t1)*cos(t2) - 20*sin(t1)*sin(t2)), 0, 0;...
                                                                                                                                                                                                                                                                                                                                                                                                                                0,                                                                                                                                                                                                                                                                                                                                                                                                                              0, 0, 0;...
                                                                                                                                                                                                                                                                                                                                                                                                                              0,                                                                                                                                                                                                                                                                                                                                                                                                                              0, 0, 0];
        dq = (inversejacob*dx);
        q0 = q0 + dq;
        x0 = ForwardKinematics(q0)*point;
        dx = (xd - x0)./step;
    end
    IK = x0;
end
