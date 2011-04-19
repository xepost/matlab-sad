function [Fout,R_cg] = gravitationalForceOrder2(I_dyadic_in, m_sc, R, M, G)
%Second order representation of the Gravitational Force
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

M = 5.976e24; % in kg
G = 6.67e-11; % in (m^3)/(kg s^2)

a_1 = [1 0 0];
Fout = [0 0 0];

Fout = -(G*M*m_sc / R^2 )*a_1 - ((3*G*M)/(2*R^4))*(trace(I_dyadic_in)-5*dot(a_1,dyadicRightDot(I_dyadic_in, a_1)))*a_1 - ((3*G*M)/(R^4))*(dyadicRightDot(I_dyadic_in, a_1));

R_cg = sqrt( G*M*m_sc / norm(Fout) );

end