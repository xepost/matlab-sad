function [lambda, theta] = quat2eulerAxisAngle(q_in)
%Compute the Euler axis and angle from the Euler parameters
% [lambda, theta] = quat2eulerAxisAngle(q_in)
%
% Author: Karl Ludwig Fetzer

lambda = zeros(3,1);

lambda = q_in(1:3) / norm(q_in(1:3));

theta = 2 * acosd( q_in(4) );

end