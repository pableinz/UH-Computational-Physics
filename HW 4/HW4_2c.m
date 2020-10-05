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
while 1
    b_new=M*b_old/norm(b_old);
    if (norm(b_new - b_old) <1.0e-6*norm(b_new))
        break;
    end
    b_old=b_new;
end
