clear; %assure that there are no conflicting variables
syms y real;
syms f(y);
f(y)=exp(y)-y^4;
%test=f(2)

%to identify the range at which we should search for the roots:
f1=figure;
fplot(@(y)f(y),[-2,10])
saveas(gcf,'HW5_1Fun','epsc');
axis([-9 9 -1 1]);
saveas(gcf,'HW5_1Froots','epsc');
%hold all;
%x=-2:0.1:10;
%z=exp(x)-x.^4;

%paramters and storage variables
ms=3;
a=[];
b=[];
x=[];
tic %for measuring the time
a0=7;
b0=10;
x0=(a0+b0)/2;
if vpa(f(a0))< vpa(f(b0))
    a(1)=a0;
    b(1)=b0;
elseif vpa(f(a0))> vpa(f(b0))
    a(1)=b0;
    b(1)=a0;
end
x(1)=x0;
iter=1;
tol=1e-6;

while 1
  
    if abs(vpa(f(x(iter))))<tol
        break;
    elseif vpa(f(x(iter)))<0
        a(iter+1)=x(iter);
        b(iter+1)=b(iter);
    elseif vpa(f(x(iter)))>0
        a(iter+1)=a(iter);
        b(iter+1)=x(iter);
    end
 
  x(iter+1)=(a(iter+1)+b(iter+1))/2;
  iter=iter+1;
end    
fr1=vpa(f(x(iter)))
r1=x(iter)
fprintf("check: ");
MLr1=fzero(@(y) exp(y)-y^4,8)
%plot(x,z,'.','MarkerSize',ms)
%axis([-9 9 -1 1]);
%axis('auto y');
toc

tic
a0=0;
b0=2;
x0=(a0+b0)/2;
if vpa(f(a0))< vpa(f(b0))
    a(1)=a0;
    b(1)=b0;
elseif vpa(f(a0))> vpa(f(b0))
    a(1)=b0;
    b(1)=a0;
end
x(1)=x0;
iter=1;
tol=1e-6;

while 1
  
    if abs(vpa(f(x(iter))))<tol
        break;
    elseif vpa(f(x(iter)))<0
        a(iter+1)=x(iter);
        b(iter+1)=b(iter);
    elseif vpa(f(x(iter)))>0
        a(iter+1)=a(iter);
        b(iter+1)=x(iter);
    end
 
  x(iter+1)=(a(iter+1)+b(iter+1))/2;
  iter=iter+1;
end    
fr2=vpa(f(x(iter)))
r2=x(iter)
fprintf("check: ");
MLr2=fzero(@(y) exp(y)-y^4,1)
toc

tic
a0=-2;
b0=0;
x0=(a0+b0)/2;
if vpa(f(a0))< vpa(f(b0))
    a(1)=a0;
    b(1)=b0;
elseif vpa(f(a0))> vpa(f(b0))
    a(1)=b0;
    b(1)=a0;
end
x(1)=x0;
iter=1;
tol=1e-6;

while 1
  
    if abs(vpa(f(x(iter))))<tol
        break;
    elseif vpa(f(x(iter)))<0
        a(iter+1)=x(iter);
        b(iter+1)=b(iter);
    elseif vpa(f(x(iter)))>0
        a(iter+1)=a(iter);
        b(iter+1)=x(iter);
    end
 
  x(iter+1)=(a(iter+1)+b(iter+1))/2;
  iter=iter+1;
end    
fr3=vpa(f(x(iter)))
r3=x(iter)
MLr3=fzero(@(y) exp(y)-y^4,-1)
toc