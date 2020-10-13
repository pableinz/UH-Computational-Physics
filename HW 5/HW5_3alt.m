clear
fitEqn = 'a*exp(-(x/b))';
fitEqn2 = 'a*exp(-x/b)+c*exp(-x/d)';
startPoints = [0.1 30];
startPoints2 = [2 10 10 5];

data1=load('data_1.csv');
data1xvals=data1(:,1);
data1yvals=data1(:,2);
options = optimset('MaxIter',10000,'TolFun',1e-8);
[d1f1, d1good1, d1out1] = fit(data1xvals,data1yvals,fitEqn,'Start', startPoints);
[d1f2, d1good2, d1out2] = fit(data1xvals,data1yvals,fitEqn2,'Start', startPoints2);
f1=figure;
plot(d1f1,data1xvals,data1yvals)
hold on
plot(d1f2,'k',data1xvals,data1yvals)
hold off


data2=load('data_2.csv');
data2xvals=data2(:,1);
data2yvals=data2(:,2);
startPoints = [1 30];
startPoints2 = [10 3 1 30];

[d2f1, d2good1, d2out1] = fit(data2xvals,data2yvals,fitEqn,'Start', startPoints);
[d2f2, d2good2, d2out2] = fit(data2xvals,data2yvals,fitEqn2,'Start', startPoints2);
f2=figure;
plot(d2f1,data2xvals,data2yvals);
hold on
plot(d2f2,'k',data2xvals,data2yvals);
hold off
data3=load('data_3.csv');
data3xvals=data3(:,1);
data3yvals=data3(:,2);
startPoints = [1 1];
startPoints2 = [10 10 5 300];

[d3f1, d3good1, d3out1] = fit(data3xvals,data3yvals,fitEqn,'Start', startPoints);
d3rsf1=d3good1.rsquare

[d3f2, d3good2, d3out2] = fit(data3xvals,data3yvals,fitEqn2,'Start', startPoints2);
d3rsf2=d3good2.rsquare

f3=figure;
plot(d3f1,data3xvals,data3yvals);
hold on
plot(d3f2,'k',data3xvals,data3yvals);
hold off