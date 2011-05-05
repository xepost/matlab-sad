function [] = project3_main()
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
I_a = (1/12) * (200^2+50^2);     % kg-m^2
I_b = (1/12) * (200^2+100^2);    % kg-m^2
I_c = (1/12) * (100^2+50^2);     % kg-m^2

I(1) = I_a; I(2) = I_b; I(3) = I_c; % Region 1
% I(1) = I_a; I(2) = I_c; I(3) = I_b; % Region 4
% I(1) = I_b; I(2) = I_a; I(3) = I_c; % Region 6

%Initial conditions:
% w0 = [0 1 0];   % Part E2
% w0 = [0.05 1 0.05];   % Part E3
E0 = [0 0 0 1]; % Part E2
w0 = [0.10 1.0 0.10;  % rad/s 1a
      0.05 1.0 0.05]; % rad/s 1b
% w0 = [0.05 1.0 0.10;  % 6a
%       0.10 1.0 0.05;  % 6b
%       -.10 1.0 -.05;  % 6c
%       -.05 1.0 -.10]; % 6d

K(1) = ( I(2)-I(3) ) / I(1); 
K(2) = ( I(3)-I(1) ) / I(2); 
K(3) = ( I(1)-I(2) ) / I(3);

orbit_step     = pi / 360; % orbits
orbits_complete = 2;     % revs
   
for IC_index = 1:size(w0,1)
   options = odeset('RelTol',1e-10);

   % This file handler uses an anonymous function so that the ode can handle extra
   % parameters as inputs to ode45.  Discussion  of this function's necessity is found here:
   % http://www.mathworks.com/matlabcentral/newsreader/view_thread/242818
   % Implementation is found here:
   % http://www.facstaff.bucknell.edu/maneval/help211/usingode45.pdf
   fileHandle = @(nu,V) project3_ODE(nu,V,K);

   [nu,V] = ode45(fileHandle, [0:orbit_step:orbits_complete],[w0(IC_index,:) E0],options);
   
   state_vector(IC_index,:,:) = V;
   

end

zeta = nu' .* 360; % degrees

sum = state_vector(IC_index,:,4).^2 + state_vector(IC_index,:,5).^2 + state_vector(IC_index,:,6).^2 + state_vector(IC_index,:,7).^2;

c22 = 1 - 2.*state_vector(:,:,6).^2 - 2.*state_vector(:,:,4).^2;
psi = acosd(c22);

C12 = 2.* (state_vector(:,:,4).*state_vector(:,:,5) - state_vector(:,:,6).*state_vector(:,:,7));
C32 = 2.* (state_vector(:,:,6).*state_vector(:,:,5) + state_vector(:,:,4).*state_vector(:,:,7));

eta_candidate1 = asind( C12 ./ sind(psi) );
eta_candidate2 = acosd( C32 ./ sind(psi) );

for IC_index = 1:size(w0,1)
   for nu_index = 1:length(nu)
      % Quadrant Checking
      if(eta_candidate1(IC_index,nu_index) > 0)
         eta11(IC_index,nu_index) = eta_candidate1(IC_index,nu_index);
         eta12(IC_index,nu_index) = real(180 - eta_candidate1(IC_index,nu_index));
      else
         eta11(IC_index,nu_index) = real(360 + eta_candidate1(IC_index,nu_index));
         eta12(IC_index,nu_index) = real(180 + abs( eta_candidate1(IC_index,nu_index)) );
      end
      
      if(eta_candidate2(IC_index,nu_index) > 0)
         eta21(IC_index,nu_index) = eta_candidate2(IC_index,nu_index);
         eta22(IC_index,nu_index) = real(360 - eta_candidate2(IC_index,nu_index));
      else
         eta21(IC_index,nu_index) = real(360 + eta_candidate2(IC_index,nu_index));
         eta22(IC_index,nu_index) = real(180 + (180-eta_candidate2(IC_index,nu_index)));
      end
      
      if ( abs(eta11(IC_index,nu_index) - eta21(IC_index,nu_index)) < 10 )
         eta(IC_index,nu_index) = eta11(IC_index,nu_index);
      elseif ( abs(eta11(IC_index,nu_index) - eta22(IC_index,nu_index)) < 10 )
         eta(IC_index,nu_index) = eta11(IC_index,nu_index);
      elseif ( abs(eta12(IC_index,nu_index) - eta21(IC_index,nu_index)) < 10 )
         eta(IC_index,nu_index) = eta12(IC_index,nu_index);
      elseif ( abs(eta12(IC_index,nu_index) - eta22(IC_index,nu_index)) < 10 )
         eta(IC_index,nu_index) = eta12(IC_index,nu_index);
      else
         warning('None of the angles match.  Are you using the right DCM/body angle sequence?')
         eta(IC_index,nu_index) = 0;
      end
   end
   eta(IC_index,:) = (180/pi) * unwrap ((eta(IC_index,:))*pi/180);
   phi(IC_index,:) = eta(IC_index,:)+zeta;
end

% psi=0;
% zeta=0;
% eta=0;
% phi=0;

project3_plotting(nu,state_vector,w0,psi,zeta,eta,phi)

end