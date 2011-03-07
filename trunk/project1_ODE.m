function dv = project1_ODE(t,v,T,I,K)
% This function contains all of the differential equations of the Euler 
%    Parameters
% Assumptions:
% Author: Karl Ludwig Fetzer

% T = 25;  % N-m
% I = 200; % kg-m^2
% K = (J-I)/I; % dimensionless

% State vector
% Dynamic Differential Equations
dv = zeros(7,1);
dv(1) = v(2) * v(3) * K;
dv(2) = 0;
dv(3) = T/I - K*v(1)*v(2);

% Kinematic Differential vquations
dv(4) =  0.5 * ( v(1)*v(7) - v(2)*v(6) + v(3)*v(5));
dv(5) =  0.5 * ( v(1)*v(6) + v(2)*v(7) - v(3)*v(4));
dv(6) =  0.5 * (-v(1)*v(5) + v(2)*v(4) + v(3)*v(7));
dv(7) = -0.5 * ( v(1)*v(4) + v(2)*v(5) + v(3)*v(6));

end