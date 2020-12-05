rng(1,'twister')


n=100000;
div=0.1;
numb=(log(10)*rand(1,n))';
vals=exp(numb);
tabulate(div*floor(vals/div))
t=tabulate(div*floor(vals/div));
dist=[];
dist(:,1)=t(:,1);
dist(:,2)=t(:,2)/(n*div);

figure(1);
hold all
x=1:1:n;
plot(x,vals,'.')
saveas(gcf,'HW8_1vals','epsc');
hold off
figure(2);
hold all
dist(:,3)=1./(dist(:,1)*log(10))
plot(dist(:,1),dist(:,2),'o')
plot(dist(:,1),dist(:,3),'*')
saveas(gcf,'HW8_1dist','epsc');
%plot(y,10./(y+1),'*')
%plot(vals)
figure(3);
hold all
plot(x,sort(vals,'descend'),'.')
hold off
saveas(gcf,'HW8_1ordervals','epsc');