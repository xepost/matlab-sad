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
orbits_complete = 2;  % rev

% For b2 as axis of symmetry for axisymmetric body B:
I_tensor = [I 0 0; 
            0 J 0; 
            0 0 I];
         
n = [-5000,5000];

psi_0 = [7]; % degrees

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
   E0 = [0 0 sind(psi_0/2) cosd(psi_0/2)];
   [nu,V] = ode45(fileHandle, [0:orbit_step:orbits_complete],[w0 E0]);

   orbits(n_index,:)         = nu;
   state_vector(n_index,:,:) = V;
   
end

zeta = nu' .* 360; % degrees


sum = state_vector(n_index,:,4).^2 + state_vector(n_index,:,5).^2 + state_vector(n_index,:,6).^2 + state_vector(n_index,:,7).^2;

c22 = 1 - 2.*state_vector(:,:,6).^2 - 2.*state_vector(:,:,4).^2;
psi = acosd(c22);

C12 = 2.* (state_vector(:,:,4).*state_vector(:,:,5) - state_vector(:,:,6).*state_vector(:,:,7));
C32 = 2.* (state_vector(:,:,6).*state_vector(:,:,5) + state_vector(:,:,4).*state_vector(:,:,7));

eta_candidate1 = asind( C12 ./ sind(psi) );
eta_candidate2 = acosd( C32 ./ sind(psi) );
for n_index = 1:length(n)
   for nu_index = 1:length(nu)
      % Quadrant Checking
      if(eta_candidate1(n_index,nu_index) > 0)
         eta11(n_index,nu_index) = eta_candidate1(n_index,nu_index);
         eta12(n_index,nu_index) = real(180 - eta_candidate1(n_index,nu_index));
      else
         eta11(n_index,nu_index) = real(360 + eta_candidate1(n_index,nu_index));
         eta12(n_index,nu_index) = real(180 + abs( eta_candidate1(n_index,nu_index)) );
      end
      
      if(eta_candidate2(n_index,nu_index) > 0)
         eta21(n_index,nu_index) = eta_candidate2(n_index,nu_index);
         eta22(n_index,nu_index) = real(360 - eta_candidate2(n_index,nu_index));
      else
         eta21(n_index,nu_index) = real(360 + eta_candidate2(n_index,nu_index));
         eta22(n_index,nu_index) = real(180 + (180-eta_candidate2(n_index,nu_index)));
      end
      
      if ( abs(eta11(n_index,nu_index) - eta21(n_index,nu_index)) < 10 )
         eta(n_index,nu_index) = eta11(n_index,nu_index);
      elseif ( abs(eta11(n_index,nu_index) - eta22(n_index,nu_index)) < 10 )
         eta(n_index,nu_index) = eta11(n_index,nu_index);
      elseif ( abs(eta12(n_index,nu_index) - eta21(n_index,nu_index)) < 10 )
         eta(n_index,nu_index) = eta12(n_index,nu_index);
      elseif ( abs(eta12(n_index,nu_index) - eta22(n_index,nu_index)) < 10 )
         eta(n_index,nu_index) = eta12(n_index,nu_index);
      else
         warning('None of the angles match.  Are you using the right DCM/body angle sequence?')
         eta(n_index,nu_index) = 0;
      end
   end
   eta(n_index,:) = (180/pi) * unwrap ((eta(n_index,:)-270)*pi/180);
   phi(n_index,:) = eta(n_index,:)+zeta;
end



project2_plotting(nu,state_vector,n, psi, zeta, eta, phi)

end