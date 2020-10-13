clear;
syms y real;
syms f(y);
f(y)=exp(y)-y^4;
test=f(2)
fplot(@(y)f(y),[-2,10])
axis([-9 9 -1 1]);
%hold all;
%x=-2:0.1:10;
%z=exp(x)-x.^4;
ms=3;

a0=7;
b0=11;
x0=(a0+b0)/2;
a=[];
b=[];
x=[];
a(1)=a0;
b(1)=b0;
x(1)=x0;
iter=1;
tol=1e-6;
tic
while 1
  if vpa(f(a(iter)))< vpa(f(b(iter)))
    if abs(vpa(f(x(iter))))<tol
        break;
    elseif vpa(f(x(iter)))<0
        a(iter+1)=x(iter);
        b(iter+1)=b(iter);
    elseif vpa(f(x(iter)))>0
        a(iter+1)=a(iter);
        b(iter+1)=x(iter);
    end
  elseif vpa(f(a(iter)))> vpa(f(b(iter)))
    if abs(vpa(f(x(iter))))<tol
        break;
    elseif vpa(f(x(iter)))>0
        a(iter+1)=x(iter);
        b(iter+1)=b(iter);
    elseif vpa(f(x(iter)))<0
        a(iter+1)=a(iter);
        b(iter+1)=x(iter);
    end
  end
  x(iter+1)=(a(iter+1)+b(iter+1))/2;
  iter=iter+1;
end    
vpa(f(x(iter)))
x(iter)
%plot(x,z,'.','MarkerSize',ms)
%axis([-9 9 -1 1]);
%axis('auto y');
toc