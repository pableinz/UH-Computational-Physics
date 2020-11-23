function dydt = odehw7(t,y,E)
r=y(1);%position
v=y(2);%velocity


dydt = zeros(2,1);
dydt(1) = y(2);%
dydt(2) = -E*y(1);

dydt = dydt(:);
end

