close all
clear
clc

scrsz = get(0,'ScreenSize');

I(1,1:3,1:3) = [500 0 0; 0 500 0; 0 0 300];

x = -1:.01:1;

y = sqrt( (1-x.^2)./0.6 );
figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(x,y,'b',x,-y,'b')
axis equal;
title('b_1 - b_3 Planar Projection of the Energy Ellipsoid')
ylabel('bhat_3')
xlabel('bhat_1')

y = sqrt( (1-x.^2));
figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(x,y,'b',x,-y,'b')
axis equal;
title('b_1 - b_2 Planar Projection of the Energy Ellipsoid')
ylabel('bhat_2')
xlabel('bhat_1')

y = sqrt( (1-x.^2)./0.6 );
figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(x,y,'b',x,-y,'b')
axis equal;
title('b_2 - b_3 Planar Projection of the Energy Ellipsoid')
ylabel('bhat_3')
xlabel('bhat_2')





%    for i = 1:length(w_mag)
%       w(inertia_index,i,1:3) = [w_mag(i) * sind(30) 0 -w_mag(i)*cosd(30)];
% 
%       s(inertia_index,i) = ((I(1,1) - I(3,3)) / I(1,1)) * (w(inertia_index,i,3));
% 
%       H = dyadicRightDot(I(1:3,1:3),w(inertia_index,i,1:3));
% 
%       p(inertia_index,i) = norm(H) / I(1,1);
% 
%       phi(inertia_index,i) = acosd((I(3,3)/(I(1,1)-I(3,3))) * s(inertia_index,i)/p(inertia_index,i));
% 
%       T(inertia_index,i) = 1 / p(inertia_index,i);
%    end
%    
% 
% scrsz = get(0,'ScreenSize');
% figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% plot(w_mag(1:i), p(1,:),'b',w_mag(1:i), p(2,:),'k')
% title('Precession rate vs w_{mag}')
% ylabel('Precession rate (rad/s)')
% xlabel('w_{mag} (rad/s)')
% legend('J = 300 kg*m^2', 'J = 75 kg*m^2','Location','EastOutside');
% 
% figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% plot(w_mag(1:i), s(1,:),'b',w_mag(1:i), s(2,:),'k')
% title('Spin rate vs w_{mag}')
% ylabel('Spin rate (rad/s)')
% xlabel('w_{mag} (rad/s)')
% legend('J = 300 kg*m^2', 'J = 75 kg*m^2','Location','EastOutside');
% 
% figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% plot(w_mag(1:i), phi(1,:),'b',w_mag(1:i), phi(2,:),'k')
% title('Nutation Angle vs w_{mag}')
% ylabel('Nutation Angle (degrees)')
% xlabel('w_{mag} (rad/s)')
% legend('J = 300 kg*m^2', 'J = 75 kg*m^2','Location','EastOutside');
% 
% figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% plot(w_mag(1:i), T(1,:),'b',w_mag(1:i), T(2,:),'k')
% title('Precession period vs w_{mag}')
% ylabel('Precession period (sec/rev)')
% xlabel('w_{mag} (rad/s)')
% legend('J = 300 kg*m^2', 'J = 75 kg*m^2','Location','EastOutside');
