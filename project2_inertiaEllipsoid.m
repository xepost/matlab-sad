close all
clear
clc

scrsz = get(0,'ScreenSize');

I(1,1:3,1:3) = [1200 0 0; 0 200 0; 0 0 1200];

x = -1:.01:1;

y = sqrt( (1-x.^2)./0.1667 );
figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(x,y,'b',x,-y,'b')
axis equal;
title('b_2 - b_3 Planar Projection of the Energy Ellipsoid')
ylabel('bhat_2')
xlabel('bhat_3')



