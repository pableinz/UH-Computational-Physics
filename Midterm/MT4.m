clear;
tic    %starts the time counter
n=200; %select matrix size
%nlist=[10,20,50,100,200,500,1000,2000]
d=1/(n+1);
Idm=eye(n);
A=d*ones(n)+d*eye(n);
check=logm(A); %to check if our program computes the same as built-in fun
tol=1e-8;     %tolerance for our expansion, closer to 0 means better approx
lnm=0;        %storing matrix result for logm(matrix)
lnm_old=0;
k=1;          %iterator
while(1)
    lnm=lnm_old+(-1)^(k+1)*((A-Idm)^k)/k;
    if norm(n*(lnm-lnm_old),'fro')<tol 
        break;
    end
    lnm_old=lnm;
    k=k+1;
end
toc %ends the time counter and prints time
%check
if max(max(abs(lnm-check)))<tol %check how to estimate truncation error.
    fprintf("true\n")
else 
    fprintf("false\n")
end
k %prints number of iterations

max(max(abs(lnm-check))) %prints max difference 
writematrix(lnm,'MT3matrix_n10Matlab.csv','Delimiter',' ')
writematrix(lnm,'MT3Checkmatrix_n10Matlab.csv','Delimiter',' ')