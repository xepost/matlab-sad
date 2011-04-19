% project2_part2d.m
% Assumptions:
% Author: Karl Ludwig Fetzer

clear
K = 1000/1200;

transition_flag = 0;

for n = -15:.001:0
   Q = n-1 - K * (n);
   C = [1 0 (-12*K*(pi^2)+4*pi^2+4*(pi^2)*Q^2) 0 (16*(pi^4)*Q^2-48*(pi^4)*K*Q)];
   lambda(1:4) = roots(C);
   for i = 1:4
      if(real(lambda(i)) > 0.001 && transition_flag == 0)
         transition_flag = n
      end
   end
end

transition_flag = 0;

for n = 15:.001:25
   Q = n-1 - K * (n);
   C = [1 0 (-12*K*(pi^2)+4*pi^2+4*(pi^2)*Q^2) 0 (16*(pi^4)*Q^2-48*(pi^4)*K*Q)];
   lambda(1:4) = roots(C);
   if(real(lambda(1)) < 0.001 && real(lambda(2)) < 0.001 && real(lambda(3)) < 0.001 && real(lambda(4)) < 0.001 && transition_flag == 0)
      transition_flag = n
   end
end
