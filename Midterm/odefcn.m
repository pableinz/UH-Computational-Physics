function dydt = odefcn(t,y)
r1=y(1:2);%star 1 position
r2=y(5:6);%star 2 position
r3=y(9:10);%star 3 position

r12=norm(r1-r2)^3;
r13=norm(r1-r3)^3;
r23=norm(r2-r3)^3;

dydt = zeros(12,1);
dydt(1:2) = y(3:4);%r1dot=star 1 velocity
dydt(3:4) = -(r1-r2)/r12-(r1-r3)/r13;
dydt(5:6) = y(7:8);%r2dot=star 2 velocity
dydt(7:8) = -(r2-r1)/r12-(r2-r3)/r23;
dydt(9:10) = y(11:12);%r3dot=star 3 velocity
dydt(11:12) = -(r3-r1)/r13-(r3-r2)/r23;
dydt = dydt(:);
end

