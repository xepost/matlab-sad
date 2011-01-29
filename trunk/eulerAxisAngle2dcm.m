function [DCM] = eulerAxisAngle2dcm(lambda, theta)
%Compute the direction cosine matrix from lambda and theta
% [DCM] = euleraxisangle2dcm(lambda, theta)
% Assumptions: theta is in degrees
%    If lambda is not a unit vector, it will be normalized.
%
% Author: Karl Ludwig Fetzer

lambda = lambda / norm(lambda);

DCM(1,1) =                      cosd(theta) + (lambda(1)^2) * (1-cosd(theta));
DCM(1,2) = -lambda(3) * sind(theta) + lambda(1) * lambda(2) * (1-cosd(theta));
DCM(1,3) =  lambda(2) * sind(theta) + lambda(3) * lambda(1) * (1-cosd(theta));
DCM(2,1) =  lambda(3) * sind(theta) + lambda(1) * lambda(2) * (1-cosd(theta));
DCM(2,2) =                      cosd(theta) + (lambda(2)^2) * (1-cosd(theta));
DCM(2,3) = -lambda(1) * sind(theta) + lambda(2) * lambda(3) * (1-cosd(theta));
DCM(3,1) = -lambda(2) * sind(theta) + lambda(3) * lambda(1) * (1-cosd(theta));
DCM(3,2) =  lambda(1) * sind(theta) + lambda(2) * lambda(3) * (1-cosd(theta));
DCM(3,3) =                      cosd(theta) + (lambda(3)^2) * (1-cosd(theta));

end