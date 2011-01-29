function [qout] = quatSuccRot(q1,q2)
%Compute the euler parameters from the direction cosine matrix
% [qout] = quatSuccRot(q1,q2)
%
% Author: Karl Ludwig Fetzer

qout = zeros(4,1);

% Scalar term
qout(4) = q1(4) * q2(4) - dot(q1(1:3),q2(1:3));

% Vector term
qout(1:3) = q1(1:3) * q2(4) + q2(1:3) * q1(4) + cross(q2(1:3),q1(1:3));

end