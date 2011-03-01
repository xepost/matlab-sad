function [precession, nutation, spin] = dcm212precnut(DCM)
%Compute the precession and nutation angles of the 2-1-2 body sequence
%  given a DCM.
% [precession, nutation, spin] = dcm212precnut(DCM)
%
% Author: Karl Ludwig Fetzer

% Use the body-two 2-1-2 Euler Angle sequence properties to determine
% nutation:
nutation = acosd( DCM(2,2) ); % [0,180] bounds automatically checked by Matlab

s2 = sind(nutation); % to be used in multiple steps

% Next, we determine precession:
theta(1,1) = asind( DCM(1,2) / s2 );

if (theta(1,1) >=0)
   theta(1,2) = 180 - theta(1,1);
else
   theta(1,2) = 180 + abs(theta(1,1));
end

theta(2,1) = acosd( DCM(3,2) / s2 );

if (theta(2,1) >= 0 && theta(2,1) < 90)
	theta(2,2) = 360 - theta(2,1);
else
   theta(2,2) = 180 + (180-theta(2,1));
end

if ( abs(theta(1,1) - theta(2,1)) < 10 )
   precession = theta(1,1);
elseif ( abs(theta(1,1) - theta(2,2)) < 10 )
   precession = theta(1,1);
elseif ( abs(theta(1,2) - theta(2,1)) < 10 )
   precession = theta(1,2);
elseif ( abs(theta(1,2) - theta(2,2)) < 10 )
   precession = theta(1,2);
else
   warning('None of the precession angles match.  Are you using the right DCM/body angle sequence?')
   precession = 0;
end
      
% Next, we determine spin:
theta = zeros(2,2);

theta(1,1) = asind( DCM(2,1) / s2 );

if (theta(1,1) >=0)
   theta(1,2) = 180 - theta(1,1);
else
   theta(1,2) = 180 + abs(theta(1,1));
end

theta(2,1) = acosd( -DCM(2,3) / s2 );

if (theta(2,1) >= 0 && theta(2,1) < 90)
	theta(2,2) = 0 - theta(2,1);
else
   theta(2,2) = 180 + (180-theta(2,1));
end

if ( abs(theta(1,1) - theta(2,1)) < 10 )
   spin = theta(1,1);
elseif ( abs(theta(1,1) - theta(2,2)) < 10 )
   spin = theta(1,1);
elseif ( abs(theta(1,2) - theta(2,1)) < 10 )
   spin = theta(1,2);
elseif ( abs(theta(1,2) - theta(2,2)) < 10 )
   spin = theta(1,2);
else
   warning('None of the spin angles match.  Are you using the right DCM/body angle sequence?')
   theta
   spin = 0;
end

end