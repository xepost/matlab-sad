function [] = project1_output(time,tstep,w_n,w,C_NtoB,theta,thetaDot, E4)
%This function plots the results of Project 1
% Assumptions:
% Author: Karl Ludwig Fetzer

% Examine decimate feature another time
%[w_n_new(1,:)] = decimate(w_n(1),10)

w_numerical_1hz(1,:) = downsample(w_n(1,:),1/tstep);
w_numerical_1hz(2,:) = downsample(w_n(2,:),1/tstep);
w_numerical_1hz(3,:) = downsample(w_n(3,:),1/tstep);

w_analytical_1hz(1,:) = downsample(w(1,:),1/tstep);
w_analytical_1hz(2,:) = downsample(w(2,:),1/tstep);
w_analytical_1hz(3,:) = downsample(w(3,:),1/tstep);

C12_1hz(1,:) = downsample(C_NtoB(1,2,:),1/tstep);
C22_1hz(1,:) = downsample(C_NtoB(2,2,:),1/tstep);
C32_1hz(1,:) = downsample(C_NtoB(3,2,:),1/tstep);

theta_1hz(1,:) = downsample(theta(1,:),1/tstep);
theta_1hz(2,:) = downsample(theta(2,:),1/tstep);
theta_1hz(3,:) = downsample(theta(3,:),1/tstep);

thetaDot_1hz(1,:) = downsample(thetaDot(1,:),1/tstep);
thetaDot_1hz(2,:) = downsample(thetaDot(2,:),1/tstep);
thetaDot_1hz(3,:) = downsample(thetaDot(3,:),1/tstep);

E4_1hz = downsample(E4,1/tstep);

% Save data to a .mat file with path "output/Project1Output.mat":
save output/Project1Output w_numerical_1hz w_analytical_1hz C12_1hz C22_1hz C32_1hz theta_1hz thetaDot_1hz E4_1hz

% Save data to an ASCII .txt file with path "output/Project1Output.txt":
save output/Project1Output.txt w_numerical_1hz w_analytical_1hz C12_1hz C22_1hz C32_1hz theta_1hz thetaDot_1hz E4_1hz -ascii 

% Convert to LaTeX code:

w_numerical_1hz_tex  = latex(sym(w_numerical_1hz));
w_analytical_1hz_tex = latex(sym(w_analytical_1hz));
C12_1hz_tex          = latex(sym(C12_1hz));
C22_1hz_tex          = latex(sym(C22_1hz));
C32_1hz_tex          = latex(sym(C32_1hz));
theta_1hz_tex        = latex(sym(theta_1hz));
thetaDot_1hz_tex     =  latex(sym(thetaDot_1hz));
E4_1hz_tex           =  latex(sym(E4_1hz));

% Save data to a LaTeX-readable file:
save output/Project1Output.tex w_numerical_1hz_tex w_analytical_1hz_tex C12_1hz_tex C22_1hz_tex C32_1hz_tex theta_1hz_tex thetaDot_1hz_tex E4_1hz_tex -ascii 

end