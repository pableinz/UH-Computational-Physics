clear; 

%clear out any previous definitions
n=1;
max_n=20;
t=2;
x=1/(1+9*exp(-t));
dx_t=9*exp(-t)/(1+9*exp(-t))^2;
Dt=[];
for n=0:max_n
    Dt(n+1)=10^(-n); 
    delta_t(n+1)=abs(dx_t-(1/Dt(n+1))*9*exp(-t)*(1-exp(-Dt(n+1)))/((1+9*exp(-t-Dt(n+1)))*(1+9*exp(-t))));

end


g=figure;
hold all;
set(g,'Visible','on');
plot(Dt,delta_t,'*','MarkerSize',5,'color','blue');
title('Roundoff error (\delta) vs step size(\Delta t)');
legend('matlab');
box on;

ax=gca;
ax.FontSize=12;
set(ax,'Xscale','log');
set(ax,'Yscale','log');
xlabel('\Delta t');
ylabel('\delta_t(\Delta t)');

saveas(gcf,'delta_tmatlab','epsc');
hold off;