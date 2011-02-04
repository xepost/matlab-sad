function [q4] = quatScalar(vector_in)
%Compute the fourth Euler parameter from the first three terms of the
%quaternion
% [q4] = quatScalar(vector_in)
% Assumptions: q4 > 0
% 
% Author: Karl Ludwig Fetzer

q4 = sqrt(1 - (vector_in(1)^2 + vector_in(2)^2 + vector_in(3)^2));

end