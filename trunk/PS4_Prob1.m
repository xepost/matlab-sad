clear;
clc;

syms m d
syms G

mass(1) = 1*m; mass(2) = 2*m; mass(3) = 5*m; mass(4) = 1*m;
r(1,1:2) = [-9,12];
r(2,1:2) = [-12,3];
r(3,1:2) = [0,8];
r(4,1:2) = [-7,5];

r_p = [-3,0];

weighted_mass = [0 0];
total_mass = 0;
F = 0;

for(i = 1:4) 
weighted_mass = weighted_mass + mass(i).*r(i,:);
total_mass = total_mass + mass(i);

F = -G*4*m * (mass(i) * ( r(i,:) - r_p ) * (sum(abs(r(i,:) - r_p).^2)^(1/2))^(-3/2));
end

cm = weighted_mass ./ total_mass
F