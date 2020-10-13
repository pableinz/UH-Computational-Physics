clear;
F=@(x,y) x.^2.*exp(-x.^2)+y.^2;
G=@(x,y) x.^4./(1+x.^2.*y.^2);

FP=fsurf(F,[-3 3 -3 3],'r')
%colormap(hot);
hold on
GP=fsurf(G)
%colormap(winter)
CP=fsurf(1,'FaceColor','y')
syms x y
[S1x,S1y]=vpasolve(x^2*exp(-x^2)+y^2==1,(x)^4/(1+x^2*y^2)==1,[-1,-1])
[S2x,S2y]=vpasolve(x^2*exp(-x^2)+y^2==1,(x)^4/(1+x^2*y^2)==1,[-1,1])
[S3x,S3y]=vpasolve(x^2*exp(-x^2)+y^2==1,(x)^4/(1+x^2*y^2)==1,[1,-1])
[S4x,S4y]=vpasolve(x^2*exp(-x^2)+y^2==1,(x)^4/(1+x^2*y^2)==1,[1,1])

x0=[1,1];
syms x y
options = optimoptions('fsolve','PlotFcn',@optimplotfirstorderopt);
[S1x,fval,flag,out]=fsolve(@intersec,x0,options)
