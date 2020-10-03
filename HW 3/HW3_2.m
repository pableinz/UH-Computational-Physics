addpath("NM4P/Matlab");

dt=[0.5 0.1 0.05 0.01 0.005 0.001];
x=0.0;
v=1.0;
T=5.0;

rk4Results=[x];
verletResults=[x];
g1=[];
g2=[];

for jiter=1:length(dt)
   
    nstep=T/dt(jiter);
    params=[];
    X=[0,0];
    sampleTimes=(((1:(nstep+1))-1)*dt(jiter))';
    
%rk4 integrator
    X(1)=x;
    X(2)=v;
    t=0.0;
    for iter=1:nstep
        X=rk4(X,t,dt(jiter),'deriv3_2',params);
        rk4Results(iter+1,jiter)= X(1);
        t=t+dt(jiter);
    end
    
    exact=1.0*sin(T)
    xfin=X(1)
    approx=rk4Results(length(sampleTimes),size(rk4Results,2))
    g2x(jiter)=abs(1.0*sin(T)-X(1))
    g2(jiter)=abs(1.0*sin(T)-rk4Results(length(sampleTimes),size(rk4Results,2)))
    
    %Verlet integrator
    X(2)=x;
    verletResults(1,jiter)= x;
    xNew=x+dt(jiter)*v+dt(jiter)*dt(jiter)*(-(x))/2;
    X(1)=xNew;
    verletResults(2,jiter)= xNew;
    t=0;
    for iter=1:nstep-1
        xCurrent=X(1);
        xNew=2*X(1)-X(2)+dt(jiter)*dt(jiter)*(-(xCurrent));
        X(1)=xNew;
        X(2)=xCurrent;
        verletResults(iter+2,jiter)= xNew;
        t=t+dt(jiter);
    end
    g1(jiter)=abs(1.0*sin(T)-verletResults(length(sampleTimes),size(verletResults,2)))
    
    if jiter==0 %set to 0 to skip plotting function and approximations. 
                %Set it to the specific Delta t that you wish to plot for
        figure 
        hold on

        plot(sampleTimes,rk4Results(:,jiter),'k');
        plot(sampleTimes,1.0*sin(sampleTimes),'g'); 
        plot(sampleTimes,verletResults(:,jiter)+.01,'r'); 
        box on;
        xlabel('t');
        ylabel('x');    
        axis([0 5. -1.1 1.1])
        legend({'rk4','A\times sin(T)','verlet'}); 
        title('\Delta t=0.5');
        
        hold off
    end
end

figure
hold on
 
plot(dt,g1,'*-r'); 
plot(dt,g2,'o-k');
plot(dt,g1/g2,'s-b');
ax=gca;
box on;
set(ax,'Xscale','log');
set(ax,'Yscale','log');
ax.FontSize=12;
xlabel('\Delta t');
ylabel('g_m=|sin(T)-x^{method}(T)|');
legend({'g_1 verlet','g_2 rk4','g1/g2'},'Location','Southeast');
saveas(gcf,'HW3-2','epsc');
