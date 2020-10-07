A = 4;
ms=4;
tspan = [0 3.5];
f1=figure;
f2=figure;
yinit=[0.0001,0.5*pi;0.1,0.5*pi;0.5,0.5*pi;1.5,0.5*pi;4.0,0.5*pi];
chars=["ob","xr","sk","vm","dy"];
for ii=1:5
    [t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, yinit(ii,:));
    figure(f1);
    plot(t,y(:,1),chars(ii),'MarkerSize',ms)
    hold all
   
end
chars2=["-b","-r","-k","m","y"];
for ii=1:5
     figure(f1)
     hold all
     z=sqrt(A./(1+((A-yinit(ii,1)^2)./yinit(ii,1)^2)*exp(-2*A*t)));

     plot(t,z,chars2(ii),'MarkerSize',ms)
     theta=0:2*pi;
     radius=sqrt(A./(1+((A-yinit(ii,1)^2)./yinit(ii,1)^2)*exp(2*A*theta)));
     figure(f2);
     
     polarplot(theta,radius);
    hold all;
end
figure(f1);
hold all;
title('Hopf model for a=4');

legend('r0=0.0001','r0=0.1','r0=0.5','r0=1.5','r0=4','Location','NorthEast');
box on

ax=gca;
ax.FontSize=12;

xlabel('t');
ylabel('r(t)');

saveas(gcf,'HW4_1b_loop_a4','epsc');

hold off

A = 2;
ms=4;
tspan = [0 6];

yinit=[0.0001,0.5*pi;0.1,0.5*pi;0.5,0.5*pi;1.5,0.5*pi;4.0,0.5*pi];
chars=["ob","xr","sk","vm","dy"];
for ii=1:5
    [t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, yinit(ii,:));
    
    plot(t,y(:,1),chars(ii),'MarkerSize',ms)
    hold all
   
end
chars2=["-b","-r","-k","m","y"];
for ii=1:5
 z=sqrt(A./(1+((A-yinit(ii,1)^2)./yinit(ii,1)^2)*exp(-2*A*t)));
 plot(t,z,chars2(ii),'MarkerSize',ms)
end
title('Hopf model for a=2');

legend('r0=0.0001','r0=0.1','r0=0.5','r0=1.5','r0=4','Location','NorthEast');
box on

ax=gca;
ax.FontSize=12;

xlabel('t');
ylabel('r(t)');

saveas(gcf,'HW4_1b_loop_a2','epsc');

hold off

A = 25;
ms=4;
tspan = [0 0.6];

yinit=[0.0001,0.5*pi;0.1,0.5*pi;0.5,0.5*pi;1.5,0.5*pi;4.0,0.5*pi];
chars=["ob","xr","sk","vm","dy"];
for ii=1:5
    [t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, yinit(ii,:));
    
    plot(t,y(:,1),chars(ii),'MarkerSize',ms)
    hold all
   
end
chars2=["-b","-r","-k","m","y"];
for ii=1:5
 z=sqrt(A./(1+((A-yinit(ii,1)^2)./yinit(ii,1)^2)*exp(-2*A*t)));
 plot(t,z,chars2(ii),'MarkerSize',ms)
end
title('Hopf model for a=25');

legend('r0=0.0001','r0=0.1','r0=0.5','r0=1.5','r0=4','Location','NorthEast');
box on

ax=gca;
ax.FontSize=12;

xlabel('t');
ylabel('r(t)');

saveas(gcf,'HW4_1b_loop_a25','epsc');

hold off

A = 100;
ms=4;
tspan = [0 0.15];

yinit=[0.0001,0.5*pi;0.1,0.5*pi;0.5,0.5*pi;1.5,0.5*pi;4.0,0.5*pi];
chars=["ob","xr","sk","vm","dy"];
for ii=1:5
    [t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, yinit(ii,:));
    
    plot(t,y(:,1),chars(ii),'MarkerSize',ms)
    hold all
   
end
chars2=["-b","-r","-k","m","y"];
for ii=1:5
 z=sqrt(A./(1+((A-yinit(ii,1)^2)./yinit(ii,1)^2)*exp(-2*A*t)));
 plot(t,z,chars2(ii),'MarkerSize',ms)
end
title('Hopf model for a=100');

legend('r0=0.0001','r0=0.1','r0=0.5','r0=1.5','r0=4','Location','NorthEast');
box on

ax=gca;
ax.FontSize=12;

xlabel('t');
ylabel('r(t)');

saveas(gcf,'HW4_1b_loop_a100','epsc');

hold off

A = 9;
ms=4;
tspan = [0 1.5];

yinit=[0.0001,0.5*pi;0.1,0.5*pi;0.5,0.5*pi;1.5,0.5*pi;4.0,0.5*pi];
chars=["ob","xr","sk","vm","dy"];
for ii=1:5
    [t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, yinit(ii,:));
    
    plot(t,y(:,1),chars(ii),'MarkerSize',ms)
    hold all
   
end
chars2=["-b","-r","-k","m","y"];
for ii=1:5
 z=sqrt(A./(1+((A-yinit(ii,1)^2)./yinit(ii,1)^2)*exp(-2*A*t)));
 plot(t,z,chars2(ii),'MarkerSize',ms)
end
title('Hopf model for a=9');

legend('r0=0.0001','r0=0.1','r0=0.5','r0=1.5','r0=4','Location','NorthEast');
box on

ax=gca;
ax.FontSize=12;

xlabel('t');
ylabel('r(t)');

saveas(gcf,'HW4_1b_loop_a9','epsc');

hold off

A = 0.25;
ms=4;
tspan = [0 40];

yinit=[0.0001,0.5*pi;0.1,0.5*pi;0.5,0.5*pi;1.5,0.5*pi;4.0,0.5*pi];
chars=["ob","xr","sk","vm","dy"];
for ii=1:5
    [t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, yinit(ii,:));
    
    plot(t,y(:,1),chars(ii),'MarkerSize',ms)
    hold all
   
end
chars2=["-b","-r","-k","m","y"];
for ii=1:5
 z=sqrt(A./(1+((A-yinit(ii,1)^2)./yinit(ii,1)^2)*exp(-2*A*t)));
 plot(t,z,chars2(ii),'MarkerSize',ms)
end
title('Hopf model for a=0.25');

legend('r0=0.0001','r0=0.1','r0=0.5','r0=1.5','r0=4','Location','NorthEast');
box on

ax=gca;
ax.FontSize=12;

xlabel('t');
ylabel('r(t)');

saveas(gcf,'HW4_1b_loop_a025','epsc');

hold off

A = 0.5;
ms=4;
tspan = [0 20];

yinit=[0.0001,0.5*pi;0.1,0.5*pi;0.5,0.5*pi;1.5,0.5*pi;4.0,0.5*pi];
chars=["ob","xr","sk","vm","dy"];
for ii=1:5
    [t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, yinit(ii,:));
    
    plot(t,y(:,1),chars(ii),'MarkerSize',ms)
    hold all
   
end
chars2=["-b","-r","-k","m","y"];
for ii=1:5
 z=sqrt(A./(1+((A-yinit(ii,1)^2)./yinit(ii,1)^2)*exp(-2*A*t)));
 plot(t,z,chars2(ii),'MarkerSize',ms)
end
title('Hopf model for a=0.5');

legend('r0=0.0001','r0=0.1','r0=0.5','r0=1.5','r0=4','Location','NorthEast');
box on

ax=gca;
ax.FontSize=12;

xlabel('t');
ylabel('r(t)');

saveas(gcf,'HW4_1b_loop_a05','epsc');

hold off


A = -4;
ms=4;
tspan = [0 1.5];

yinit=[0.0001,0.5*pi;0.1,0.5*pi;0.5,0.5*pi;1.5,0.5*pi;4.0,0.5*pi];
chars=["ob","xr","sk","vm","dy"];
for ii=1:5
    [t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, yinit(ii,:));
    
    plot(t,y(:,1),chars(ii),'MarkerSize',ms)
    hold all
   
end
chars2=["-b","-r","-k","m","y"];
for ii=1:5
 z=sqrt(A./(1+((A-yinit(ii,1)^2)./yinit(ii,1)^2)*exp(-2*A*t)));
 plot(t,z,chars2(ii),'MarkerSize',ms)
end
title('Hopf model for a= -4');

legend('r0=0.0001','r0=0.1','r0=0.5','r0=1.5','r0=4','Location','NorthEast');
box on

ax=gca;
ax.FontSize=12;

xlabel('t');
ylabel('r(t)');

saveas(gcf,'HW4_1b_loop_an4','epsc');

hold off
