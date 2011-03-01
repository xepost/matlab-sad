function [precession_rate, nutation_rate, spin_rate] = dcm212precnutrate(theta, w)
%Compute the angular rates of the 2-1-2 body sequence
% [precession_rate, nutation_rate, spin_rate] = dcm212precnutrate(DCM, w)
%
% Author: Karl Ludwig Fetzer

precession_rate = ( w(1)*sind(theta(3)) - w(3)*cosd(theta(3)) ) / sind(theta(2));
nutation_rate   = ( w(1)*cosd(theta(3)) + w(3)*sind(theta(3)) );
spin_rate       = (-w(1)*sind(theta(3)) + w(3)*cosd(theta(3)) ) * cosd(theta(2)) / sind(theta(2)) + w(2);
end