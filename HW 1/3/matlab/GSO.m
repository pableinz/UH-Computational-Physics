function [v2_temp] = GSO(a,b)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
mod_a=sqrt(sum(a.*a));
mod_b=sqrt(sum(b.*b));
dot_ab=sum(a.*b);
c=1/sqrt(1-(dot_ab/(mod_a*mod_b))^2);
v2_temp=(b-(dot_ab/mod_a^2)*a)*c;

end

