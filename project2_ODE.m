function dv = project2_ODE(nu,v,s_star,K)
% This function contains all of the differential equations of the Euler 
%    Parameters
% Assumptions:
% Author: Karl Ludwig Fetzer

% I = 200; % kg-m^2
% K = (J-I)/I; % dimensionless

% State vector
% Dynamic Differential Equations
dv    = zeros(7,1);
dv(1) = 2*pi* ( s_star * v(3) + K * ( 6 *(v(5)*v(6)+v(4)*v(7))*(1-2*v(4)^2-2*v(5)^2) - v(2)*v(3) ));
dv(2) = 0;
dv(3) = 2*pi* (-s_star * v(1) + K * (-12*(v(6)*v(4)-v(5)*v(7))*(v(5)*v(6)+v(4)*v(7)) + v(1)*v(2) ));

% Kinematic Differential vquations
dv(4) =  pi * ( v(1)*v(7) - v(2)*v(6) + v(3)*v(5) - v(6) + s_star*v(6) );
dv(5) =  pi * ( v(1)*v(6) + v(2)*v(7) - v(3)*v(4) - v(7) - s_star*v(7) );
dv(6) =  pi * (-v(1)*v(5) + v(2)*v(4) + v(3)*v(7) + v(4) - s_star*v(4) );
dv(7) =  pi * (-v(1)*v(4) - v(2)*v(5) - v(3)*v(6) + v(5) + s_star*v(5) );

end