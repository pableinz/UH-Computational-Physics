function myfun=intersec(X)


myfun(1)= X(1)^2*exp(-X(1)^2)+X(2)-1;
myfun(2)= X(1)^4/(1+X(1)^2*X(2)^2)-1;

