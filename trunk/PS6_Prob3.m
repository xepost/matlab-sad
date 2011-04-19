close all
clear
clc

I(1,1:3,1:3) = [500 0 0; 0 500 0; 0 0 300];
I(2,1:3,1:3) = [500 0 0; 0 500 0; 0 0 75];

w_mag = 0.1:0.1:15;

for inertia_index = 1:2
   I_current(1:3,1:3) = I(inertia_index,1:3,1:3);
   
   for i = 1:length(w_mag)
      w(inertia_index,i,1:3) = [w_mag(i) * sind(30) 0 -w_mag(i)*cosd(30)];

      s(inertia_index,i) = ((I_current(1,1) - I_current(3,3)) / I_current(1,1)) * (w(inertia_index,i,3));

      H = dyadicRightDot(I_current(1:3,1:3),w(inertia_index,i,1:3));

      p(inertia_index,i) = norm(H) / I_current(1,1);

      phi(inertia_index,i) = acosd((I_current(3,3)/(I_current(1,1)-I_current(3,3))) * s(inertia_index,i)/p(inertia_index,i));

      T(inertia_index,i) = 1 / p(inertia_index,i);
   end
end

scrsz = get(0,'ScreenSize');
figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(w_mag(1:i), p(1,:),'b',w_mag(1:i), p(2,:),'k')
title('Precession rate vs w_{mag}')
ylabel('Precession rate (rad/s)')
xlabel('w_{mag} (rad/s)')
legend('J = 300 kg*m^2', 'J = 75 kg*m^2','Location','EastOutside');

figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(w_mag(1:i), s(1,:),'b',w_mag(1:i), s(2,:),'k')
title('Spin rate vs w_{mag}')
ylabel('Spin rate (rad/s)')
xlabel('w_{mag} (rad/s)')
legend('J = 300 kg*m^2', 'J = 75 kg*m^2','Location','EastOutside');

figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(w_mag(1:i), phi(1,:),'b',w_mag(1:i), phi(2,:),'k')
title('Nutation Angle vs w_{mag}')
ylabel('Nutation Angle (degrees)')
xlabel('w_{mag} (rad/s)')
legend('J = 300 kg*m^2', 'J = 75 kg*m^2','Location','EastOutside');

figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(w_mag(1:i), T(1,:),'b',w_mag(1:i), T(2,:),'k')
title('Precession period vs w_{mag}')
ylabel('Precession period (sec/rev)')
xlabel('w_{mag} (rad/s)')
legend('J = 300 kg*m^2', 'J = 75 kg*m^2','Location','EastOutside');
