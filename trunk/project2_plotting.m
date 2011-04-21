function [] = project2_plotting(nu,state_vector,n,psi1,psi2,psi3)
%This function plots the results of Project 1
% Assumptions:
% Author: Karl Ludwig Fetzer

scrsz = get(0,'ScreenSize');
% % 
%% Task B:
%% Nutation Angle
for n_index = 1:length(n)
%  for n_index = 1
   figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%       axes('YLim',[-5 25])
   title(strcat('Psi vs orbit for n = ', num2str(n(n_index))))
   ylabel('Psi (degrees)')
   xlabel('Orbits (rev)')
   hold on
   plot(nu,psi1(n_index,:),'k.-',nu,psi2(n_index,:),'b.-',nu,psi3(n_index,:),'r.-')
   hold off
   savefig(strcat('output/proj2_psi_n_eq_', num2str(n(n_index))),gcf,'pdf');
end

%% Task A:
% %% Angular Velocity
% for n_index = 1:length(n)
%    if (n_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%       axes('YLim',[-5 25])
%       title('w_1 vs orbit')
%       ylabel('Angular Velocity (rad/s)')
%       xlabel('Orbits (rev)')
%       hold on
%    end
%    plot(nu,state_vector(n_index,:,1))
% end
% savefig('output/proj2_w1',gcf,'pdf');
% hold off
% 
% for n_index = 1:length(n)
%    if (n_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%       axes('YLim',[-5 25])
%       title('w_2 vs orbit')
%       ylabel('Angular Velocity (rad/s)')
%       xlabel('Orbits (rev)')
%       hold on
%    end
%    plot(nu,state_vector(n_index,:,2))
% end
% savefig('output/proj2_w2',gcf,'pdf');
% hold off
% 
% for n_index = 1:length(n)
%    if (n_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%       axes('YLim',[-5 25])
%       title('w_3 vs orbit')
%       ylabel('Angular Velocity (rad/s)')
%       xlabel('Orbits (rev)')
%       hold on
%    end
%    plot(nu,state_vector(n_index,:,3))
% end
% savefig('output/proj2_w3',gcf,'pdf');
% hold off
% 
% %% Euler Parameters
% for n_index = 1:length(n)
%    if (n_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%       axes('YLim',[-0.1 1.1])
%       title('E_1 vs orbit')
%       ylabel('Euler Parameter')
%       xlabel('Orbits (rev)')
%       hold on
%    end
%    plot(nu,state_vector(n_index,:,4))
% end
% savefig('output/proj2_E1',gcf,'pdf');
% hold off
% 
% for n_index = 1:length(n)
%    if (n_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%       axes('YLim',[-0.1 1.1])
%       title('E_2 vs orbit')
%       ylabel('Euler Parameter')
%       xlabel('Orbits (rev)')
%       hold on
%    end
%    plot(nu,state_vector(n_index,:,5))
% end
% savefig('output/proj2_E2',gcf,'pdf');
% hold off
% 
% for n_index = 1:length(n)
%    if (n_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%       axes('YLim',[-0.1 1.1])
%       title('E_3 vs orbit')
%       ylabel('Euler Parameter')
%       xlabel('Orbits (rev)')
%       hold on
%    end
%    plot(nu,state_vector(n_index,:,6))
% end
% savefig('output/proj2_E3',gcf,'pdf');
% hold off
% 
% for n_index = 1:length(n)
%    if (n_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%       axes('YLim',[-0.1 1.1])
%       title('E_4 vs orbit')
%       ylabel('Euler Parameter')
%       xlabel('Orbits (rev)')
%       hold on
%    end
%    plot(nu,state_vector(n_index,:,7))
% end
% savefig('output/proj2_E4',gcf,'pdf');
% hold off

end