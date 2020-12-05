clear;
rng(2,'twister');

kT=1;
zeta=1;
m=1;
k1=0.1;
k2=1;
tau1=m/zeta;
tau2=sqrt(1/(zeta^2/(4*m^2)-k1/m));
dt=0.001;
nstep=100000;
nrun=10000;


xvals=zeros(1,nstep);
yvals=zeros(1,nstep);
xsqvals=zeros(1,nstep);
ysqvals=zeros(1,nstep);
vsqvals=zeros(1,nstep);
tvals=zeros(1,nstep);

disp('predicted timescales:')
disp(tau1)
disp(tau2)

for i=1:nrun

	x=[0;0];
	t=0;
	xold=[0;0];
	xnew=[0;0];  %note!  reinitialize!
    R=[];

	for i=1:nstep
		R(1)=randn()*sqrt(2*zeta*kT/dt);
        R(2)=randn()*sqrt(2*zeta*kT/dt);
		xnew=x;
        f=force(x,k1,k2);
		xnew=xnew+(x-xold).*(1-zeta*dt/2/m)/(1+zeta*dt/2/m);
		xnew=xnew+(R+f)*dt*dt/m/(1+zeta*dt/2/m);
		v=(xnew-xold)/(2*dt);

		xold=x;
		x=xnew;
		t=t+dt;


		xvals(i)=xvals(i)+x(1)/nrun;
        yvals(i)=yvals(i)+x(2)/nrun;
		xsqvals(i)=xsqvals(i)+x(1)*x(1)/nrun;
        ysqvals(i)=ysqvals(i)+x(2)*x(2)/nrun;
		vsqvals(i)=vsqvals(i)+(v(1)*v(1)+v(2)*v(2))/nrun;
		tvals(i)=t;
	end
end


figure
hold on
plot(tvals,vsqvals,'r')
plot(tvals.*1.1,ones(1,nstep).*(kT/m),'k')

xlabel('t (us)')
ylabel('<v^2> (nm/us)^2')
legend({'simulation','equipartition'},'Location','southeast')
hold off



figure
hold on
plot(tvals,xsqvals,'r')
plot(tvals.*1.1,tvals.*(2*kT/zeta),'k')
xlabel('t (us)')
ylabel('<x^2> nm^2')
legend({'simulation','diffusion'},'Location','southeast')
hold off


figure
hold on
plot(tvals,xvals,'r')
xlabel('t (us)')
ylabel('<x> (nm)')
hold off

function f=force(x,k1,k2)
    k1=1
    f=k2*(x-1).^2/2;
end





