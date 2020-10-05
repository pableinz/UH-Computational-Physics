A = 2;
ms=3;
tspan = [0 3.5];

yinit=[0.0001,0.5*pi;0.1,0.5*pi;0.5,0.5*pi;1.5,0.5*pi;4.0,0.5*pi];

y0 = [0.0001 10];
[t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, y0);
plot(t,y(:,2),'-o','MarkerSize',ms)
hold all

y0 = [0.1 10];
[t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, y0);
plot(t,y(:,2),'-x','MarkerSize',ms)

y0 = [0.5 10];
[t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, y0);
plot(t,y(:,2),'-s','MarkerSize',ms)

y0 = [1.5 10];
[t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, y0);
plot(t,y(:,2),'-.','MarkerSize',ms)

y0 = [4 10];
[t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, y0);
plot(t,y(:,2),'-','MarkerSize',ms)



title('Hopf model theta solution for a=2');

legend('r0=0.0001','r0=0.1','r0=0.5','r0=1.5','r0=4');
box on

ax=gca;
ax.FontSize=12;

xlabel('t');
ylabel('theta(t)');

saveas(gcf,'HW4_1b_thetasola2','epsc');

hold off
