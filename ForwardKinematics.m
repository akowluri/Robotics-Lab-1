function FK=ForwardKinematics(theta)
    FK=rotationZ(theta(1))*translationX(3)*rotationZ(theta(2))*translationX(6)*translationZ(0.5)*translationX(2)*rotationZ(theta(4));
end