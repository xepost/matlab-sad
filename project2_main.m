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

orbit_step      = 0.001; % rev
orbits_complete = 4;  % rev

% For b2 as axis of symmetry for axisymmetric body B:
I_tensor = [I 0 0; 
            0 J 0; 
            0 0 I];
         
n = [20];

s_star = [0 K*n n-1];

psi_0 = 7; % degrees

for s_index = 1:length(s_star)
   %Initial conditions:
   w0 = [0 n 0]; % rad/s
   E0 = [sind(psi_0/2) 0 0 cosd(psi_0/2)];
   % % 
   % % H0 = dyadicRightDot(I_tensor,w0);
   % % 
   % % eig_mag = abs(w0(2) * K);

   % options = odeset('RelTol',1e-4);

   % This file handler uses an anonymous function so that the ode can handle extra
   % parameters as inputs to ode45.  Discussion  of this function's necessity is found here:
   % http://www.mathworks.com/matlabcentral/newsreader/view_thread/242818
   % Implementation is found here:
   % http://www.facstaff.bucknell.edu/maneval/help211/usingode45.pdf
   fileHandle = @(nu,V) project2_ODE(nu,V,s_star(s_index),K);

   [nu,V] = ode45(fileHandle, [0:orbit_step:orbits_complete],[w0 E0]);
   
   orbits(s_index,:)         = nu;
   state_vector(s_index,:,:) = V;
   state_vector_errors(s_index,:,1) = V(:,1) - 0;
   state_vector_errors(s_index,:,2) = V(:,2) - n;
   state_vector_errors(s_index,:,3) = V(:,3) - 0;
   state_vector_errors(s_index,:,4) = V(:,4) - 0;
   state_vector_errors(s_index,:,5) = V(:,5) - 0;
   state_vector_errors(s_index,:,6) = V(:,6) - 0;
   state_vector_errors(s_index,:,7) = V(:,7) - 1;
   
end

c22 = 1 - 2.*state_vector(:,:,6).^2 - 2.*state_vector(:,:,4).^2;
psi = acosd(c22);
   
project2_plotting(nu,state_vector,s_star, psi)

end