n=50;

M=zeros(n,n);
b=ones(n,1);
for ii=1:n
    for jj=1:n
        if abs(ii-jj)<3
            M(ii,jj)=1;
        end
    end
end
[V,D] = eig(M);
%Because D is a diagonal matrix, we only need one index to call it
[max_e, imax_e]=max(max(D));
max_V=V(:,imax_e);

max_lV=max_e*max_V;
b_old=b;
kmax=0;
while 1
   
    b_new=M*b_old/norm(b_old);
    if (norm(b_new - b_old) <1.0e-6*norm(b_new))
        break;
    end
     kmax=kmax+1;
    b_old=b_new;
end
i=1:1:50;
i=i';
error=abs(max_lV-b_new)./max_lV*100;

f1 = figure;
f2 = figure;
f3 = figure;

figure(f1);

plot(i,error,'x')
title('Error in maximum eigenvector determination');
legend('error(iter vs numerical)');
box on
ax=gca;
ax.FontSize=12;
xlabel('entry');
ylabel('error(%)');

saveas(gcf,'HW4_2error','epsc');

figure(f2);
hold all;
plot(i,max_lV,'or')
plot(i,b_new,'xk')
plot(i,error,'x')
title('Maximum eigenvector determination');
legend('Max eigenvector');
box on
ax=gca;
ax.FontSize=12;
xlabel('entry');
ylabel('Max eigenvector component');
saveas(gcf,'HW4_2cd','epsc');

hold off;


figure(f3);
hold all;
errorbar(i,b_new,error)
title('Maximum eigenvector determination');
legend('Max eigenvector');
box on
ax=gca;
ax.FontSize=12;
xlabel('entry');
ylabel('Max eigenvector component');
saveas(gcf,'HW4_2cdbars','epsc');
hold off;