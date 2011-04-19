function [vout] = dyadicRightDot(I_dyadic_in, vin)
%Dot a dyadic with a vector on the right side.
% [vout] = dyadicRightDot(I_dyadic_in, vin)
% 
% v_out = I . v_in
% Result is in the vector basis of the left side of the inertia dyadic
%
% Author: Karl Ludwig Fetzer

vout(1) = I_dyadic_in(1,1)*vin(1) + I_dyadic_in(1,2)*vin(2)+ I_dyadic_in(1,3)*vin(3);
vout(2) = I_dyadic_in(2,1)*vin(1) + I_dyadic_in(2,2)*vin(2) + I_dyadic_in(2,3)*vin(3);
vout(3) = I_dyadic_in(3,1)*vin(1) + I_dyadic_in(3,2)*vin(2) + I_dyadic_in(3,3)*vin(3);

end