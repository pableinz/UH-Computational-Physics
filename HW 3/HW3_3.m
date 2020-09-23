Clear;
w0=0.5;
w1=0.0;
w2=-0.25;

Z=5.0;
dz=0.1;
nstep=Z/dz;

rk4Results=[];
W=[0,0,0];

sampleTimes=(((1:(nstep+1))-1)*dt);
    
%rk4 integrator
    W(1)=w0;
    W(2)=w1;
    W(3)=w2;
    t=0.0;
    