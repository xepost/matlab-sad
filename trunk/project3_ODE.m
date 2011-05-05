function dv = project3_ODE(nu,v,K)
% This function contains all of the differential equations of the Euler 
%    Parameters
% Assumptions:
% Author: Karl Ludwig Fetzer

% State vector
% Dynamic Differential Equations
dv    = zeros(7,1);
dv(1) = 2*pi*K(1)*( v(2)*v(3) - 6 *(v(5)*v(6)+v(4)*v(7))*(1-2*v(4)^2-2*v(5)^2));
dv(2) = 2*pi*K(2)*( v(1)*v(3) - 6 *(v(6)*v(4)-v(5)*v(7))*(1-2*v(4)^2-2*v(5)^2));
dv(3) = 2*pi*K(3)*( v(1)*v(2) -12 *(v(5)*v(6)+v(4)*v(7))*(v(6)*v(4)-v(5)*v(7)));

% Kinematic Differential Equations
dv(4) =  pi * ( v(1)*v(7) - ( v(2)+1)*v(6) + v(3)*v(5) );
dv(5) =  pi * ( v(1)*v(6) + ( v(2)-1)*v(7) - v(3)*v(4) );
dv(6) =  pi * (-v(1)*v(5) + ( v(2)+1)*v(4) + v(3)*v(7) );
dv(7) =  pi * (-v(1)*v(4) - ( v(2)-1)*v(5) - v(3)*v(6) );

end