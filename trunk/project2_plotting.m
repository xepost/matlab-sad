function [] = project2_plotting(nu,state_vector,n,psi)
%This function plots the results of Project 1
% Assumptions:
% Author: Karl Ludwig Fetzer

scrsz = get(0,'ScreenSize');
% % 
%% Task B:
%% Nutation Angle
for n_index = 1:length(n)
   if (n_index == 1)
      figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%       axes('YLim',[-5 25])
      title('Psi vs orbit')
      ylabel('Psi (degrees)')
      xlabel('Orbits (rev)')
      hold on
      color = 'k.-';
   elseif (n_index == 2)
      color = 'k*-';
   elseif (n_index == 3)
      color = 'b*-';
   elseif (n_index == 4)
      color = 'b.-';      
   end
   plot(nu,psi(n_index,:),color)
end
savefig('output/proj2_psi',gcf,'pdf');
hold off

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