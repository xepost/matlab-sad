function [] = project3_plotting(nu,state_vector,w0,psi,zeta,eta,phi)
%This function plots the results of Project 1
% Assumptions:
% Author: Karl Ludwig Fetzer

scrsz = get(0,'ScreenSize');
% % 
%% Task B:
%% Nutation Angle
for IC_index = 1:size(w0,1)
   if (IC_index == 1)
      figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
   %       axes('YLim',[-5 25])
      title('Psi vs orbit (Region 1) ')
      ylabel('Psi (degrees)')
      xlabel('Orbits (rev)')
      hold on
      color = 'k.-';
   elseif (IC_index == 2)
      color = 'r.-';
   elseif (IC_index == 3)
      color = 'b.-';
   elseif (IC_index == 4)
      color = 'g.-';    
   end
      plot(nu,psi(IC_index,:),color)
end
hold off
savefig('output/proj3_psi_E3_R1_10rev',gcf,'pdf');

% %% Orbit Angle
% for IC_index = 1:size(w0,1)
%    if (IC_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%    %       axes('YLim',[-5 25])
%       title('Zeta vs orbit (Region 6) ')
%       ylabel('Zeta (degrees)')
%       xlabel('Orbits (rev)')
%       hold on
%       color = 'k.-';
%    elseif (IC_index == 2)
%       color = 'r.-';
%    elseif (IC_index == 3)
%       color = 'b.-';
%    elseif (IC_index == 4)
%       color = 'g.-';    
%    end
%       plot(nu,zeta,color)
% end
%    hold off
%    savefig('output/proj3_zeta_E2_R6',gcf,'pdf');
%    
%% Precession Angle
for IC_index = 1:size(w0,1)
   if (IC_index == 1)
      figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
   %       axes('YLim',[-5 25])
      title('Eta vs orbit (Region 6) ')
      ylabel('Eta (degrees)')
      xlabel('Orbits (rev)')
      hold on
      color = 'k.-';
   elseif (IC_index == 2)
      color = 'r.-';
   elseif (IC_index == 3)
      color = 'b.-';
   elseif (IC_index == 4)
      color = 'g.-';    
   end
      plot(nu,eta(IC_index,:),color)
end
   hold off
   savefig('output/proj3_eta_E3_R6',gcf,'pdf');
   
   
%% Phi Angle
for IC_index = 1:size(w0,1)
   if (IC_index == 1)
      figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
   %       axes('YLim',[-5 25])
      title('Phi vs orbit (Region 6) ')
      ylabel('Phi (degrees)')
      xlabel('Orbits (rev)')
      hold on
      color = 'k.-';
   elseif (IC_index == 2)
      color = 'r.-';
   elseif (IC_index == 3)
      color = 'b.-';
   elseif (IC_index == 4)
      color = 'g.-';    
   end
      plot(nu,phi(IC_index,:),color)
end
   hold off
   savefig('output/proj3_phi_E3_R6',gcf,'pdf');
   
   
%% Task A:
%% Angular Velocity
% for IC_index = 1:size(w0,1)
%    if(IC_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%          axes('YLim',[-0.5 0.5])
%          title('w_1 vs Time')
%          ylabel('Angular Velocity (rad/s)')
%          xlabel('Time (sec)')
%          hold on
%          color = 'k-';
%    elseif(IC_index == 2)
%          color = 'b-';
%    elseif(IC_index == 3)
%          color = 'r-';
%    elseif(IC_index == 4)
%          color = 'g-';
%    end
%    plot(nu,state_vector(IC_index,:,1),color)
% end
% savefig('output/proj3_w1_R6',gcf,'pdf');
%    hold off
%    
% for IC_index = 1:size(w0,1)
%    if(IC_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%          axes('YLim',[-1.5 1.5])
%          title('w_2 vs Time')
%          ylabel('Angular Velocity (rad/s)')
%          xlabel('Time (sec)')
%          hold on
%          color = 'k-';
%    elseif(IC_index == 2)
%          color = 'b-';
%    elseif(IC_index == 3)
%          color = 'r-';
%    elseif(IC_index == 4)
%          color = 'g-';
%    end
%    plot(nu,state_vector(IC_index,:,2),color)
% end
% savefig('output/proj3_w2_R6',gcf,'pdf');
%    hold off
%    
% for IC_index = 1:size(w0,1)
%    if(IC_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
%          axes('YLim',[-0.5 0.5])
%          title('w_3 vs Time')
%          ylabel('Angular Velocity (rad/s)')
%          xlabel('Time (sec)')
%          hold on
%          color = 'k-';
%    elseif(IC_index == 2)
%          color = 'b-';
%    elseif(IC_index == 3)
%          color = 'r-';
%    elseif(IC_index == 4)
%          color = 'g-';
%    end
%    plot(nu,state_vector(IC_index,:,3),color)
% end
% savefig('output/proj3_w3_R6',gcf,'pdf');
%    hold off
%    
% for IC_index = 1:size(w0,1)
%    if(IC_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% %          axes('YLim',[-0.5 0.5])
%          title('w_3 vs w_1')
%          ylabel('Angular Velocity (rad/s)')
%          xlabel('Angular Velocity (rad/s)')
%          hold on
%          color = 'k-';
%    elseif(IC_index == 2)
%          color = 'b-';
%    elseif(IC_index == 3)
%          color = 'r-';
%    elseif(IC_index == 4)
%          color = 'g-';
%    end
%    plot(state_vector(IC_index,:,1),state_vector(IC_index,:,3),color)
% end
% savefig('output/proj3_w3vsw1_R6',gcf,'pdf');
%    hold off
%    
% for IC_index = 1:size(w0,1)
%    for t_index = 1:length(nu)
%       w(1) = state_vector(IC_index,t_index,1);
%       w(2) = state_vector(IC_index,t_index,2);
%       w(3) = state_vector(IC_index,t_index,3);
% 
%       w_u = w / norm(w);
% 
%       theta(IC_index,t_index) = acosd( dot( [ 0 1 0 ], w_u));
%    end
%    
%    if(IC_index == 1)
%       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% %          axes('YLim',[-0.5 0.5],'XLim',[-0.5 0.5])
% %          axes()
%          title('Angle between b_2 and w')
%          ylabel('Angle (degrees)')
%          xlabel('time (sec)')
%          hold on
%          color = 'k-';
%    elseif(IC_index == 2)
%          color = 'b-';
%    elseif(IC_index == 3)
%          color = 'r-';
%    elseif(IC_index == 4)
%          color = 'g-';
%    end
%    plot(nu,theta(IC_index,:)',color)
% end
% savefig('output/proj3_b2vsw_R6',gcf,'pdf');
%    hold off

% % 
% % %% Euler Parameters
% % for IC_index = 1:length(n)
% %    if (IC_index == 1)
% %       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% %       axes('YLim',[-0.1 1.1])
% %       title('E_1 vs orbit')
% %       ylabel('Euler Parameter')
% %       xlabel('Orbits (rev)')
% %       hold on
% %    end
% %    plot(nu,state_vector(IC_index,:,4))
% % end
% % savefig('output/proj2_E1',gcf,'pdf');
% % hold off
% % 
% % for IC_index = 1:length(n)
% %    if (IC_index == 1)
% %       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% %       axes('YLim',[-0.1 1.1])
% %       title('E_2 vs orbit')
% %       ylabel('Euler Parameter')
% %       xlabel('Orbits (rev)')
% %       hold on
% %    end
% %    plot(nu,state_vector(IC_index,:,5))
% % end
% % savefig('output/proj2_E2',gcf,'pdf');
% % hold off
% % 
% % for IC_index = 1:length(n)
% %    if (IC_index == 1)
% %       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% %       axes('YLim',[-0.1 1.1])
% %       title('E_3 vs orbit')
% %       ylabel('Euler Parameter')
% %       xlabel('Orbits (rev)')
% %       hold on
% %    end
% %    plot(nu,state_vector(IC_index,:,6))
% % end
% % savefig('output/proj2_E3',gcf,'pdf');
% % hold off
% % 
% % for IC_index = 1:length(n)
% %    if (IC_index == 1)
% %       figure('Position',[scrsz(3)/4 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2])
% %       axes('YLim',[-0.1 1.1])
% %       title('E_4 vs orbit')
% %       ylabel('Euler Parameter')
% %       xlabel('Orbits (rev)')
% %       hold on
% %    end
% %    plot(nu,state_vector(IC_index,:,7))
% % end
% % savefig('output/proj2_E4',gcf,'pdf');
% % hold off

end