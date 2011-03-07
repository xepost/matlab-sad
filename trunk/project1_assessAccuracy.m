function [] = project1_assessAccuracy(time,tstep,w_n,w,C_NtoB,theta,thetaDot, quat)
%This function examines the accuracy of the numerical integrator
% Assumptions:
% Author: Karl Ludwig Fetzer

%% Determine Angular Velocity error and Quaternion Constraint Equation error
w_error = abs(w_n-w);

w_errmax(1) = max(w_error(1,:));
w_errmax(2) = max(w_error(2,:));
w_errmax(3) = max(w_error(3,:));

K = abs(sqrt(quat(1,:).^2+quat(2,:).^2+quat(3,:).^2+quat(4,:).^2) - ones(1,length(quat)));

%% Plot error
% Angular velocity
scrsz = get(0,'ScreenSize');
figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(0:tstep:time(length(w_error)),w_error(1,:), 0:tstep:time(length(w_error)),w_error(2,:),0:tstep:time(length(w_error)),w_error(3,:))

title('Angular velocity error time history')
ylabel('angular velocity (rad/s)')
xlabel('time (s)')
legend('w1_err','w2_err','w3_err','Location','EastOutside');

% savefig('output/werr_vs_t',gcf,'eps');

% Quaternion Constraint Equation
figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
plot(0:tstep:time(length(K)),K)

title('Euler Parameter constraint equation (K) error time history')
ylabel('K')
xlabel('time (s)')
% legend('E4','Location','EastOutside');

% savefig('output/Kerr_vs_t',gcf,'eps');
end