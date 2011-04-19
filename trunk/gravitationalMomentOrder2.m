function [Mg_out] = gravitationalMomentOrder2(I_dyadic_in, m_sc, R, M, G)
%Second order representation of the Gravitational Moment
% [vout] = dyadicRightDot(I_dyadic_in, vin)
% Default values for Earth: M = 5.976x10^24 kg
%                           G = 6.67x10^-11 (m^3)/(kg s^2)
% F = [ -GMm/R^2 ]a_1 + (3/2 GM/R^4) [trace(I)-5*a_1.I.a_1] a_1 - (3
% GM/R^4) [I.a_1] + ...
% Assumptions: 
%    1) Inertia dyadic and other terms are in the inertial vector basis.
%    2) Higher order terms (...) can be ignored.
%
% Author: Karl Ludwig Fetzer

if nargin < 5, G = 6.67e-11; end; % in (m^3)/(kg s^2)
if nargin < 4, M = 5.976e24; end; % in kg

a_1 = [1 0 0];

Mg_out = (3*G*M/(R^3))*cross(a_1, dyadicRightDot(I_dyadic_in, a_1));

end