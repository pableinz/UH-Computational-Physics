clear;
E=0.01;
dE=1.0e-2;
x0=0;
v0=1;
Y0=[x0;v0];
dt=0.000001;
tol=1.0e-8;
options = odeset('RelTol', 1.0e-8, 'AbsTol', 1.0E-8);
iter=1;
while(1)
    tspan = 0:dt:pi;
    iter=iter+1
    [t,y] = ode45(@(t,y) odehw7(t,y,E), tspan, Y0, options);
    
    bE=y(length(t),1)
    
    [tdE,ydE] = ode45(@(t,y) odehw7(t,y,E+dE), tspan, Y0, options);
    
    bEdE=ydE(length(tdE),1);
    bpE=(bEdE-bE)/dE
    E=E-bE/bpE
    if (abs(bE)<tol)
        break;
    end
end
deriv=diff(y(:,2))./diff(t);
deriv(length(diff(y(:,2)))+1)=diff(y(1:2,2))./diff(t(1:2));
f1=figure;
hold on
index=1:10000:length(t);
tplot=t(index);
xplot=y(index,1);
vplot=y(index,2);
derivplot=deriv(index);
plot ( tplot, xplot, 'k.');
plot ( tplot, vplot, 'b.');
plot ( tplot, derivplot, 'g.');
plot ( tplot, 1, 'r.');
plot ( tplot, -1, 'r.');
legend('pos','vel','acc')
title ( 'f1 Problem 3 HW7' )
%saveas(gcf,'MT5emod','epsc');
hold off
%{
f2=figure;
plot ( tdE, ydE(:,1), 'k.');
hold on
plot ( tdE, ydE(:,2), 'b.');
plot ( tdE, 1, 'r.');
plot ( tdE, -1, 'r.');

legend('pos2','vel2')
title ( 'f2 Problem 3 HW7' )
%}