function [] = project2_main()
% This is the driver of the project1 simulations
% Assumptions:
% Author: Karl Ludwig Fetzer

% hold on; % This command allows plots to be overlaid for various cases
close all; % This command closes all open figure windows
clear;     % This command removes all variables from the workspace
clc;       % This command removes all interactions from the command line

format long;

m = 350;     % kg
% % T = 0;       % N-m
I = 1200;    % kg-m^2
J = 200;     % kg-m^2
K = (I-J)/I; % dimensionless

orbit_step      = 0.05; % rev
orbits_complete = 4;  % rev

% For b2 as axis of symmetry for axisymmetric body B:
I_tensor = [I 0 0; 
            0 J 0; 
            0 0 I];
         
n = [-25,-15,0,1,5,10,15,25,35];

psi_0 = [0,7,3.5]; % degrees

for n_index = 1:length(n)
   s_star = n(n_index) - 1;

   % % 
   % % H0 = dyadicRightDot(I_tensor,w0);
   % % 
   % % eig_mag = abs(w0(2) * K);

%    oldOpts = odeset;
%    newOpts = odeset(oldOpts,'RelTol',1e-6,'AbsTol',1e-10)
   
   % This file handler uses an anonymous function so that the ode can handle extra
   % parameters as inputs to ode45.  Discussion  of this function's necessity is found here:
   % http://www.mathworks.com/matlabcentral/newsreader/view_thread/242818
   % Implementation is found here:
   % http://www.facstaff.bucknell.edu/maneval/help211/usingode45.pdf
   fileHandle = @(nu,V) project2_ODE(nu,V,s_star,K);

   %Initial conditions:
   w0 = [0 n(n_index) 0]; % rad/s
   E0 = [0 0 sind(psi_0(1)/2) cosd(psi_0(1)/2)];
   [nu,V1] = ode45(fileHandle, [0:orbit_step:orbits_complete],[w0 E0]);
   
   E0 = [0 0 sind(psi_0(2)/2) cosd(psi_0(2)/2)];
   [nu,V2] = ode45(fileHandle, [0:orbit_step:orbits_complete],[w0 E0]);
   E0 = [0 0 sind(psi_0(3)/2) cosd(psi_0(3)/2)];
   [nu,V3] = ode45(fileHandle, [0:orbit_step:orbits_complete],[w0 E0]);

   orbits(n_index,:)         = nu;
   state_vector1(n_index,:,:) = V1;
   state_vector2(n_index,:,:) = V2;
   state_vector3(n_index,:,:) = V3;

end

sum1 = state_vector1(n_index,:,4).^2 + state_vector1(n_index,:,5).^2 + state_vector1(n_index,:,6).^2 + state_vector1(n_index,:,7).^2;
sum2 = state_vector2(n_index,:,4).^2 + state_vector2(n_index,:,5).^2 + state_vector2(n_index,:,6).^2 + state_vector2(n_index,:,7).^2;
sum3 = state_vector3(n_index,:,4).^2 + state_vector3(n_index,:,5).^2 + state_vector3(n_index,:,6).^2 + state_vector3(n_index,:,7).^2;

c22 = 1 - 2.*state_vector1(:,:,6).^2 - 2.*state_vector1(:,:,4).^2;
psi1 = acosd(c22);

c22 = 1 - 2.*state_vector2(:,:,6).^2 - 2.*state_vector2(:,:,4).^2;
psi2 = acosd(c22);

c22 = 1 - 2.*state_vector3(:,:,6).^2 - 2.*state_vector3(:,:,4).^2;
psi3 = acosd(c22);
   
project2_plotting(nu,state_vector1,n, psi1, psi2, psi3)

end