function [qdot_out] = quatRate(q_in, w_in)
%Compute the direction cosine matrix from Euler Parameters
% [qdot_out] = quatRate(q_in, w_in)
% Assumptions: w_in is in the body frame
%
% Author: Karl Ludwig Fetzer

qdot_out(1:3) =  0.5*(q_in(4)*w_in + cross(q_in(1:3),w_in));
qdot_out(4)   = -0.5*dot(w_in,q_in(1:3));

end