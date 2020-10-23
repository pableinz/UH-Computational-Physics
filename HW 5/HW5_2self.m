clear;
tic
syms x y;
r = sym('x_%d',[2 1]);
F=@(r) r(1)^2*exp(-r(1)^2)+r(2)^2-1;
G=@(r) r(1)^4/(1+r(1)^2*r(2)^2)-1;

h=@(r) [F(r);G(r)];
J=@(r) jacobian(h(r),[r]);
Jinv=@(r) inv(J(r));
%Jinv0=subs(Jinv([x;y]),{x,y},{r0(1),r0(2)}) %for testing
r0=[-1;-1];
rold=r0;
rnew=[0;0];
iter=1;
sx=[];%for storing and analyzing convergence
sy=[];
tol=1e-12;
while(1)
    rnew=rold-vpa(subs(Jinv([x;y]),{x,y},{rold(1),rold(2)}))*vpa(subs(h([x;y]),{x,y},{rold(1),rold(2)}));
    sx(iter)=(rnew(1))
    sy(iter)=(rnew(2))
    rold=rnew;
    
    iter=iter+1;
    if(vpa(subs(h([x;y]),{x,y},{rold(1),rold(2)}))<tol)
        break;
    end
end
root=vpa(rnew)
rnew
toc
%1.1739777098108600266775112342048
%0.80786881713905550481258636604307