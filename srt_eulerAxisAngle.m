function [ b ] = srt_eulerAxisAngle( a, lambda, theta )
%Compute the direction cosine matrix from lambda and theta
% [DCM] = euleraxisangle2dcm(lambda, theta)
% Inputs:  a      = vector before rotation
%          lambda = axis of rotation
%          theta  = angle of rotation
% Outputs: b      = vector after rotation, in terms of "a" basis
% Assumptions: theta is in degrees
%    If lambda is not a unit vector, it will be normalized.
%
% Author: Karl Ludwig Fetzer

lambda = lambda / norm(lambda);

% Come up with a dyadic notation function in matlab
b = a * cosd(theta) - cross(a,lambda*sind(theta)) + dot(a,lambda) * lambda * (1-cosd(theta));

% Add a 3d plotter that will take increments of theta from zero to theta
% and plot all of the intermediate vectors, in addition to the BOLD start
% and finish vectors.

end

