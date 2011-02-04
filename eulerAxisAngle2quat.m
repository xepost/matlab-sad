function [q_out] = eulerAxisAngle2quat(lambda, theta)
%Compute the Euler parameters from the Euler axis and angle
% [q_out] = eulerAxisAngle2quat(lambda, theta)
% Assumptions: Lambda is converted to a unit vector
%    Theta is measured in degrees
% 
% Author: Karl Ludwig Fetzer

q_out = zeros(4,1);

lambda = lambda/norm(lambda);

q_out(1:3) = lambda.*sind(theta/2);
q_out(4)   = cosd(theta/2);

end