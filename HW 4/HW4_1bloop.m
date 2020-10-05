A = 4;
ms=4;
tspan = [0 3.5];

yinit=[0.0001,0.5*pi;0.1,0.5*pi;0.5,0.5*pi;1.5,0.5*pi;4.0,0.5*pi];
chars=["-o","-x","-s","-.","-"];
for ii=1:5
    [t,y] = ode45(@(t,y) odefcn(t,y,A), tspan, yinit(ii,:));
    plot(t,y(:,1),chars(ii),'MarkerSize',ms)
    hold all
end


title('Hopf model theta solution for a=4');

legend('r0=0.0001','r0=0.1','r0=0.5','r0=1.5','r0=4');
box on

ax=gca;
ax.FontSize=12;

xlabel('t');
ylabel('r(t)');

saveas(gcf,'HW4_1b_loop_a4','epsc');

hold off
