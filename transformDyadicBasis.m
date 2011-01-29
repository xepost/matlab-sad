function [I_dyadic_out] = transformDyadicBasis(I_dyadic_in, DCM)
%Transform the dyadic I from one vector basis to another using a direction
%cosine matrix
% [I_dyadic_out] = transformDyadicBasis(I_dyadic_in, DCM)
% 
% I_ab = n_a * I * n_b
%
% Author: Karl Ludwig Fetzer

I_dyadic_out = zeros(3,3);

for a = 1:3
   vector_left = DCM(:,a);
   
   for b = 1:3
      vector_right = DCM(:,b);
      vector_intermediate = zeros(3,1);
      
      for i = 1:3
         for j = 1:3
            % The left-hand dot product is calculated here
            vector_intermediate(j) = vector_intermediate(j) + vector_left(i) * I_dyadic_in(i,j);
         end
      end
      
      % Each component is assigned here
      I_dyadic_out(a,b) = dot(vector_intermediate, vector_right);
   end
end

end