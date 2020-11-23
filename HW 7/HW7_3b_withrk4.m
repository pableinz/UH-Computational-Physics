clear;
addpath('NM4P/Matlab');

x0=0;
v0=1;
t=0;
T=pi;

dt=0.0001;
nstep=T/dt;
E=0.01;
dE=1.0e-2;

X=[0,0];
sampleTimes=(1:(nstep+1))*dt;
tol=1.0e-8;
while(1)
    rk4ResE=[x0];

    X(1)=x0;
    X(2)=v0;
    t=0;

    for iter=1:nstep
        X=rk4(X,t,dt,'derivex',E);
        rk4ResE=[rk4ResE X(1)];
        t=t+dt;
    end
    bE=rk4ResE(length(sampleTimes))
    
    rk4ResdE=[x0];
    X(1)=x0;
    X(2)=v0;
    t=0;

    for iter=1:nstep
        X=rk4(X,t,dt,'derivex',E+dE);
        rk4ResdE=[rk4ResdE X(1)];
        t=t+dt;
    end
    bEdE=rk4ResdE(length(sampleTimes));
    bpE=(bEdE-bE)/dE
    E=E-bE/bpE
    if (abs(bE)<tol)
        break;
    end

end    
figure
subplot(121)
hold on

plot(sampleTimes,rk4ResE,'k'); 

xlabel('t');
ylabel('x');
legend({'rk4'},'Location','southwest');

subplot(122)
hold on
plot(sampleTimes,rk4ResdE,'k'); 
xlabel('t');
ylabel('theta');


