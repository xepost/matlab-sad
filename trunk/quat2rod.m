function [v_out] = quat2rod(q_in)
%Compute the Rodrigues parameters from the Euler parameters
% [v_out] = quat2rod(q_in)
%
% Author: Karl Ludwig Fetzer

v_out = zeros(3,1);

v_out = q_in(1:3) / q_in(4);

end