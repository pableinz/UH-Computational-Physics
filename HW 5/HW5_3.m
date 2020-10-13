clear;
init_vals=[1,100];
init_vals2=[2,5,5,2];
options = optimset('MaxIter',10000,'TolFun',1e-6);

data1=load('data_1.csv');
data1xvals=data1(:,1);
data1yvals=data1(:,2);

[data1bf1 data1fval1]=fminsearch(@(x)lsquares(data1xvals,data1yvals,@fitfunction,x),init_vals,options);  
[data1bf2 data1fval2]=fminsearch(@(x)lsquares(data1xvals,data1yvals,@fitfunction2,x),init_vals2,options);  
f1=figure %plot data and fit
hold on
plot(data1xvals,data1yvals,'o','MarkerSize',3)
plot(data1xvals,fitfunction(data1xvals,data1bf1),'k','Linewidth',1)
plot(data1xvals,fitfunction2(data1xvals,data1bf2),'r','Linewidth',1)
hold off



data2=load('data_2.csv');
data2xvals=data2(:,1);
data2yvals=data2(:,2);

[data2bf1 data2fval1]=fminsearch(@(x)lsquares(data2xvals,data2yvals,@fitfunction,x),init_vals,options);  
[data2bf2 data2fval2]=fminsearch(@(x)lsquares(data2xvals,data2yvals,@fitfunction2,x),init_vals2,options);  
f2=figure; %plot data and fit
hold on
plot(data2xvals,data2yvals,'o','MarkerSize',3)
plot(data2xvals,fitfunction(data2xvals,data2bf1),'k','Linewidth',1)
plot(data2xvals,fitfunction2(data2xvals,data2bf2),'r','Linewidth',1)




function x=fitfunction(t,params)
    A=params(1);
    tau=params(2);
    x=A*exp(-t/tau);%our fit function
end

function x=fitfunction2(t,params)
    A=params(1);
    tau1=params(2);
    B=params(3);
    tau2=params(4);
    x=A*exp(-t/tau1)+B*exp(-t/tau2);%our fit function
end


function d=lsquares(tvals,xvals,fitfun,params)  %computes the squared error between fit and data
    d=sum((xvals-fitfun(tvals,params)).^2);
end
