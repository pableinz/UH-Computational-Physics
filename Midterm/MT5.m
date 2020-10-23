clear;
r1i=[0.01;0.0];r2i=[0;1.0];r3i=[0;-1.0];
v1i=[0.0;0.0];v2i=[1.0;0];v3i=[-1.0;0];
y0=[r1i;v1i;r2i;v2i;r3i;v3i];
tspan = [0 100];
options = odeset('RelTol', 1.0e-11, 'AbsTol', 1.0E-11);
[t,y] = ode45(@(t,y) odefcn(t,y), tspan, y0, options);

r1t=[y(:,1), y(:,2)];%star 1 position
r2t=[y(:,5), y(:,6)];%star 2 position
r3t=[y(:,9), y(:,10)];%star 3 position

plot ( r1t(:,1), r1t(:,2), 'k.');
hold on
plot(r2t(:,1), r2t(:,2), 'r.')
plot(r3t(:,1), r3t(:,2), 'b.')
axis equal;
legend('star 1','star 2','star 3')
title ( 'Three body problem' )
saveas(gcf,'MT5emod','epsc');
hold off
r12t=((r1t(:,1)-r2t(:,1)).^2+(r1t(:,2)-r2t(:,2)).^2).^(1/2);
r13t=((r1t(:,1)-r3t(:,1)).^2+(r1t(:,2)-r3t(:,2)).^2).^(1/2);
r23t=((r2t(:,1)-r3t(:,1)).^2+(r2t(:,2)-r3t(:,2)).^2).^(1/2);
Ut=-1./r12t-1./r13t-1./r23t;

v1tsq=y(:,3).^2+y(:,4).^2;
v2tsq=y(:,7).^2+y(:,8).^2;
v3tsq=y(:,11).^2+y(:,12).^2;
Kt=0.5*(v1tsq+v2tsq+v3tsq);

f2=figure;
plot(t,Kt, 'b-')
hold on
plot(t,Ut,'r-')
plot(t,Ut+Kt,'k-')
legend('K','U','E')
title ( 'Three body problem, Energies' )
saveas(gcf,'MT5emod_energy','epsc');
hold off