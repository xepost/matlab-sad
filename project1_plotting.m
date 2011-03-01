function [] = project1_plotting(time,w_n,w,quat_n,theta,thetaDot,C_NtoB)
% This function plots the results of Project 1
% Assumptions:
% Author: Karl Ludwig Fetzer

%% Angular velocity
figure
plot(time,w_n(1,:),'b-',time,w_n(2,:),'b-.',time,w_n(3,:),'b.')
hold on
plot(time,w(1,:),'k-', time,w(2,:),'k-.', time,w(3,:),'k.')
title('Angular velocity time history')
ylabel('angular velocity (rad/s)')
xlabel('time (s)')

%% Quaternion
% The quaternion constraint equation is desired for plotting
K_quat = quat_n(1,:).^2 + quat_n(2,:).^2 + quat_n(3,:).^2 + quat_n(4,:).^2;
figure
plot(time,quat_n(1,:),'-',time,quat_n(2,:),'-.',time,quat_n(3,:),'.',time,quat_n(4,:),'-',time,K_quat(:))
title('Euler parameter time history')
ylabel('euler parameters')
xlabel('time (s)')

%% Euler Angle Sets
figure
plot(time,theta(1,:))
title('Precession angle time history')
ylabel('precession angle (degrees)')
xlabel('time (s)')

figure
plot(time,theta(2,:))
title('Nutation angle time history')
ylabel('nutation angle (degrees)')
xlabel('time (s)')


% figure
% plot(time,theta(1,:), time,theta(2,:), time,theta(3,:))
% title('Euler angle set time history')
% ylabel('euler angles (degrees)')
% xlabel('time (s)')

%% Euler Angle velocities
figure
plot(time,thetaDot(1,:), time,thetaDot(2,:), time,thetaDot(3,:))
title('Euler angular rate time history')
ylabel('euler angular velocities (rad/s)')
xlabel('time (s)')
end