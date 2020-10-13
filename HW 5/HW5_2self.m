clear;

F=@(x,y) x.^2.*exp(-x.^2)+y.^2;
G=@(x,y) x.^4./(1+x.^2.*y.^2);

x0=[1];
y0=[1];
x=[];
y=[];
iter=1;
while(1)
   
    x(iter+1)=x(iter)-F(x(iter),y(1))
    
    iter=iter+1;
end