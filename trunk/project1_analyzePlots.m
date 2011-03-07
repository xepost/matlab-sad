function [] = project1_analyzePlots(time,tstep,w_n,w,C_NtoB,theta,thetaDot, quat)
%This function aids in the analysis of the orientation angles and
%spacecraft motion
% Assumptions:
% Author: Karl Ludwig Fetzer

%% Plot orientation angles
%Angular velocity
scrsz = get(0,'ScreenSize');
figure('Position',[scrsz(3)/4 1 scrsz(3)/2 scrsz(4)])
subplot(3,1,1), plot(0:tstep:time(length(theta)),theta(1,:)) 
title('Orientation Angle time history')
ylabel('precession (degrees)')
subplot(3,1,2), plot(0:tstep:time(length(theta)),theta(2,:))
ylabel('nutation   (degrees)')
subplot(3,1,3), plot(0:tstep:time(length(theta)),theta(3,:))
ylabel('spin       (degrees)')
xlabel('time (s)')
savefig('output/orAngle_vs_t',gcf,'eps');

% % Quaternion Constraint Equation
% figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% plot(0:tstep:time(length(K)),K)
% 
% title('Euler Parameter constraint equation (K) error time history')
% ylabel('K')
% xlabel('time (s)')
% % legend('E4','Location','EastOutside');
% 
% savefig('output/Kerr_vs_t',gcf,'eps');
end