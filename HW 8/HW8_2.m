clear;
rng(2,'twister');

kT=1;
zeta=1;
m=1;
k1=0.1;
k2=1;
tau1=m/zeta;
tau2=sqrt(1/(zeta^2/(m^2)-4*k1/m));
dt=0.001;
nstep=100000;
nrun=10000;
N=2;

xvals=zeros(1,nstep);
xsqvals=zeros(1,nstep);
vsqvals=zeros(1,nstep);
tvals=zeros(1,nstep);

disp('predicted timescales:')
disp(tau1)
disp(tau2)

for i=1:nrun

	x=0;
	t=0;
	xold=0;
	xnew=0;  %note!  reinitialize!


	for i=1:nstep
		R=randn()*sqrt(2*zeta*kT/dt);
		xnew=x;
        f=force(x,k1,k2);
		xnew=xnew+(x-xold)*(1-zeta*dt/2/m)/(1+zeta*dt/2/m);
		xnew=xnew+(R+f)*dt*dt/m/(1+zeta*dt/2/m);
		v=(xnew-xold)/(2*dt);

		xold=x;
		x=xnew;
		t=t+dt;


		xvals(i)=xvals(i)+x/nrun;
		xsqvals(i)=xsqvals(i)+x*x/nrun;
		vsqvals(i)=vsqvals(i)+v*v/nrun;
		tvals(i)=t;
	end
end
xvals=xvals/N;
xsqvals=xsqvals/N;
vsqvals=vsqvals/N;

figure
hold on
plot(tvals,vsqvals,'r')
plot(tvals.*1.1,ones(1,nstep).*(kT/(m*N)),'k')

xlabel('t ')
ylabel('<v^2>' )
legend({'simulation','equipartition'},'Location','southeast')
saveas(gcf,'HW8_2velsq','epsc');
hold off



figure
hold on
plot(tvals,xsqvals,'r')
plot(tvals.*1.1,5*ones(1,nstep),'k')
xlabel('t ')
ylabel('<x^2> ')
legend({'simulation','harmonic limit'},'Location','southeast')
saveas(gcf,'HW8_2xsq','epsc');
hold off


figure
hold on
plot(tvals,xvals,'r')
xlabel('t ')
ylabel('<x> ')
saveas(gcf,'HW8_2xvals','epsc');
hold off

function f=force(x,k1,k2)
   
    f=-k1*(x);
end





