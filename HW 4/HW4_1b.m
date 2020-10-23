clear;
A = 4;
ms=5;
tspan = [0 10];

hold all

y0 = [4 10];
[t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, y0);
%plot(t,y(:,1),'x','MarkerSize',ms)
z=sqrt(A./(1+((A-y0(1)^2)./y0(1)^2)*exp(-2*A*t)));

plot(z.*cos(t),z.*sin(t),'.','MarkerSize',ms)

title('Hopf model theta solution for a=2');

legend('r0=4');
box on

ax=gca;
ax.FontSize=12;

xlabel('t');
ylabel('theta(t)');

saveas(gcf,'HW4_1b_thetasola2','epsc');

hold off
