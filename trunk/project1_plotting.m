function [] = project1_plotting(time,w_n,w,C_NtoB,theta,thetaDot,quat_n)
%This function plots the results of Project 1
% Assumptions:
% Author: Karl Ludwig Fetzer


scrsz = get(0,'ScreenSize');
% Example
%figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% ScreenSize = [left, bottom, width, height]
%where left and bottom define the distance from the lower-left corner of
%the screen to the lower-left corner of the figure window. width and height define the dimensions of the window.

%% Angular velocity
figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(time,w_n(1,:),'b-',time,w_n(2,:),'k-',time,w_n(3,:),'r-')
hold on
plot(time,w(1,:),'b.', time,w(2,:),'k.', time,w(3,:),'r.')
title('Angular velocity time history')
ylabel('angular velocity (rad/s)')
xlabel('time (s)')
legend('w_1 numerical','w_2 numerical','w_3 numerical','w_1 analytical','w_2 analytical','w_3 analytical','Location','EastOutside');
%legend('boxoff'); % Makes legend transparent
savefig('output/w_vs_t',gcf,'eps');

%% Euler Angle Sets
figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(time,theta(1,:))
title('Precession angle time history')
ylabel('precession angle (degrees)')
xlabel('time (s)')
savefig('output/precession',gcf,'eps');

figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(time,theta(2,:))
title('Nutation angle time history')
ylabel('nutation angle (degrees)')
xlabel('time (s)')
savefig('output/nutation',gcf,'eps');

% figure
% plot(time,theta(1,:), time,theta(2,:), time,theta(3,:))
% title('Euler angle set time history')
% ylabel('euler angles (degrees)')
% xlabel('time (s)')

%% Direction Cosine Matrix
C12 = zeros(1,length(time));
C32 = zeros(1,length(time));
C12(:) = C_NtoB(1,2,:);
C32(:) = C_NtoB(3,2,:);

figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
DCMplot = plot(C12,C32);
title('C32 vs C12')
ylabel('C32')
xlabel('C12')
savefig('output/C12vsC32',gcf,'eps');

for (index = 1: length(time))
   if (time(index) == 1.5 || time(index) == 3.1)
      figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
      DCMplot = plot(C12,C32);
      txt = strcat('C32 vs C12 with label at t=', num2str(time(index)),'sec');
      title(txt)
      ylabel('C32')
      xlabel('C12')
      makedatatip(DCMplot,index)
      savefig(strcat('output/C12vsC32_at', num2str(index)),gcf,'eps');
   end
end
text

%% Quaternion
% The quaternion constraint equation is desired for plotting

% K_quat = quat_n(1,:).^2 + quat_n(2,:).^2 + quat_n(3,:).^2 + quat_n(4,:).^2;

% figure
% plot(time,quat_n(1,:),'-',time,quat_n(2,:),'-.',time,quat_n(3,:),'.',time,quat_n(4,:),'-',time,K_quat(:))
% title('Euler parameter time history')
% ylabel('euler parameters')
% xlabel('time (s)')



%% Euler Angle velocities
% figure
% plot(time,thetaDot(1,:), time,thetaDot(2,:), time,thetaDot(3,:))
% title('Euler angular rate time history')
% ylabel('euler angular velocities (rad/s)')
% xlabel('time (s)')
end