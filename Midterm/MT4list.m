clear;


nlist=[10,20,50,100,200,500,1000,2000]
tollist=[1e-3] %1e-7 1e-6 1e-5 1e-4 1e-3 1e-2];
for iter=1:length(nlist)
    tic
    n=nlist(iter); %select matrix size
    Idm=eye(n);
    d=1/(n+1);
    A=d*(ones(n)+eye(n));
    
    tol=1e-3;
    lnm=0;
    lnm_old=0;
    k=1;
    while(1)
        lnm=lnm_old+(-1)^(k+1)*mpower((A-Idm),k)/k;
        if norm(n*(lnm-lnm_old),'fro')<tol
            break;
        end
        lnm_old=lnm;
        k=k+1;
    end
    %check
    check=logm(A);
    if max(max(abs(lnm-check)))<n*tol %check how to estimate truncation error.
        fprintf("true\n")
    else 
        fprintf("false\n")
    end
    t(iter)=toc
    k
    max(max(abs(lnm-check)))
end

tpy=[0	0.01562572	0.02193499	0.33395457	1.62722063	41.60720015	388.6626847	3064.141765];
kpy=[35	58	111	175	266	427	567	704];
tcpp=[0.022145	0.193	7.93	119	2342];
kcpp=[65 133 349 726 1511];
tml=[0.0919	0.037	0.0423	0.1191	1.2165	36.7406	357.7278	3399.6];
kml=[35	58	111	175	266	427	567	704];

plot(nlist,tpy,'ro-')
hold on
plot(nlist,tml,'bx-')
plot(nlist(1:length(tcpp)),tcpp,'ks-')
xlist=0:1:2000;
plot(xlist,1/2.2e6.*(xlist.^3))%n^3/approximate operations per sec of a 2.2GHz CPU
legend('py','matlab','cpp','prediction','Location','Northwest')
title ( 'Computational runtime and complexity (tol=10^{-3})' )
saveas(gcf,'MT4complexity','epsc');
hold off
%run with 1/n, tol 1e-6 t = 0.0326    0.0080    0.1867    0.9955    9.1882  397.4469
%t =   1.0e+03*5.1646

