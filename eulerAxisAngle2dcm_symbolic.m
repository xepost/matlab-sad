function [DCM] = eulerAxisAngle2dcm_symbolic(lambda, theta)
%Compute the direction cosine matrix from lambda and theta
% [DCM] = eulerAxisAngle2dcm_symbolic(lambda, theta)
% Assumptions: lambda and theta are symbolic parameters
%
% Author: Karl Ludwig Fetzer

DCM(1,1) =                      cos(theta) + (lambda(1)^2) * (1-cos(theta));
DCM(1,2) = -lambda(3) * sin(theta) + lambda(1) * lambda(2) * (1-cos(theta));
DCM(1,3) =  lambda(2) * sin(theta) + lambda(3) * lambda(1) * (1-cos(theta));
DCM(2,1) =  lambda(3) * sin(theta) + lambda(1) * lambda(2) * (1-cos(theta));
DCM(2,2) =                      cos(theta) + (lambda(2)^2) * (1-cos(theta));
DCM(2,3) = -lambda(1) * sin(theta) + lambda(2) * lambda(3) * (1-cos(theta));
DCM(3,1) = -lambda(2) * sin(theta) + lambda(3) * lambda(1) * (1-cos(theta));
DCM(3,2) =  lambda(1) * sin(theta) + lambda(2) * lambda(3) * (1-cos(theta));
DCM(3,3) =                      cos(theta) + (lambda(3)^2) * (1-cos(theta));

end