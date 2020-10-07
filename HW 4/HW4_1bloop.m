A = 4;
ms=4;
tspan = [0 20];
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
     theta0=pi/2;
     figure(f2);
   
     axis equal;
     plot(z.*cos(theta0-t),z.*sin(theta0-t),'-','MarkerSize',ms)
     plot(y(:,1).*cos(theta0-t),y(:,1).*sin(theta0-t),chars(ii),'MarkerSize',ms)
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
