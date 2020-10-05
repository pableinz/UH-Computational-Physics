function dydt = odefcn(t,y,A)
dydt = zeros(2,1);
dydt(1) = y(1)*(A-y(1)^2);
dydt(2) = -1;