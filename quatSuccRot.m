function [qout] = quatSuccRot(q1,q2,q3)
%Compute the final set of euler parameters from intermediate quaternions
% [qout] = quatSuccRot(q1,q2,q3)
%
% Author: Karl Ludwig Fetzer

% If there are only two rotations, the calculation is straightforwardly
% calculated as follows:
if (nargin == 2)
   qout = zeros(4,1);
   
   % Scalar term
   qout(4) = q1(4) * q2(4) - dot(q1(1:3),q2(1:3));
   
   % Vector term
   qout(1:3) = q1(1:3) * q2(4) + q2(1:3) * q1(4) + cross(q2(1:3),q1(1:3));
   
% If there are three rotations, the final quaternion is calculated in
% steps:
%    1. Determine the intermediate rotation from the original frame through
%    the second rotation.
%    2. Determine the final rotation from the original frame through the
%    third rotation.
% This is accomplished by executing the straightforward two-rotation
% calculation above.
elseif (nargin == 3)
   
   q_1_2 = quatSuccRot(q1,q2);
   
   qout = quatSuccRot(q_1_2,q3);
end
end