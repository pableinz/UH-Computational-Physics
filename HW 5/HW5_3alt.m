clear;
fitEqn = fittype('a*exp(-t/tau)','independent','t');
fitEqn2 = fittype('a*exp(-t/tau1)+b*exp(-t/tau2)','independent','t');
startPoints = [30 1];
startPoints2 = [30 1 50 10];

options = fitoptions('Method', 'NonLinearLeastSquares','Start', startPoints,'TolFun',1e-8);
options2 = fitoptions('Method', 'NonLinearLeastSquares','Start', startPoints2,'TolFun',1e-8);
data1=load('data_1.csv');
data1xvals=data1(:,1);
data1yvals=data1(:,2);

[d1f1, d1f1good, d1f1out] = fit(data1xvals,data1yvals,fitEqn,options);
[d1f2, d1f2good, d1f2out] = fit(data1xvals,data1yvals,fitEqn2,options2);

f1=figure;
pd1=plot(data1xvals,data1yvals,'.b');
hold on
pd1f1=plot(d1f1,'-k');
pd1f2=plot(d1f2,'-r');
legend([pd1 pd1f1 pd1f2],['data 1'],['fitEqn1 R^2=' num2str(d1f1good.rsquare)],['fitEqn2 R^2=' num2str(d1f2good.rsquare)]);
title('Fits for data 1');
box on
ax=gca;
xlabel('t');
ylabel('x(t)');
%labels the axes 
saveas(gcf,'HW5_3_d1fitIC1s3','epsc');
hold off


data2=load('data_2.csv');
data2xvals=data2(:,1);
data2yvals=data2(:,2);
startPoints = [30 1];
startPoints2 = [3 10 30 1];
options = fitoptions('Method', 'NonLinearLeastSquares','Start', startPoints,'TolFun',1e-8);
options2 = fitoptions('Method', 'NonLinearLeastSquares','Start', startPoints2,'TolFun',1e-8);

[d2f1, d2f1good, d2f1out] = fit(data2xvals,data2yvals,fitEqn,options);
[d2f2, d2f2good, d2f2out] = fit(data2xvals,data2yvals,fitEqn2,options2);
f2=figure;
pd2=plot(data2xvals,data2yvals,'.b');
hold on
pd2f1=plot(d2f1,'-k');
pd2f2=plot(d2f2,'-r');
legend([pd2 pd2f1 pd2f2],['data 2'],['fitEqn1 R^2=' num2str(d2f1good.rsquare)],['fitEqn2 R^2=' num2str(d2f2good.rsquare)]);
title('Fits for data 2');
box on
ax=gca;
xlabel('t');
ylabel('x(t)');
%labels the axes 

saveas(gcf,'HW5_3_d2fitIC1s3','epsc');
hold off


data3=load('data_3.csv');
data3xvals=data3(:,1);
data3yvals=data3(:,2);
startPoints = [1 30];
startPoints2 = [1 2 30 10];
options = fitoptions('Method', 'NonLinearLeastSquares','Start', startPoints,'TolFun',1e-8);
options2 = fitoptions('Method', 'NonLinearLeastSquares','Start', startPoints2,'TolFun',1e-8);

[d3f1, d3f1good, d3f1out] = fit(data3xvals,data3yvals,fitEqn,options);
%d3rsf1=d3f1good.rsquare

[d3f2, d3f2good, d3f2out] = fit(data3xvals,data3yvals,fitEqn2,options2);
%d3rsf2=d3f2good.rsquare

f3=figure;
pd3=plot(data3xvals,data3yvals,'.b');
hold on
pd3f1=plot(d3f1,'-k');
pd3f2=plot(d3f2,'-r');
legend([pd3 pd3f1 pd3f2],['data 3'],['fitEqn1 R^2=' num2str(d3f1good.rsquare)],['fitEqn2 R^2=' num2str(d3f2good.rsquare)]);
title('Fits for data 3');
box on
ax=gca;
xlabel('t');
ylabel('x(t)');
saveas(gcf,'HW5_3_d3fitIC1s3','epsc');

hold off
