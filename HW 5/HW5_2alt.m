clear;
syms x y z
eqn1 = 1 == x^2*exp(-x^2) + y^2;
eqn2 = 1 == x^4/(1+x^2*y^2);

equations = [eqn1 eqn2];
fimplicit3(equations)
axis([-3 3 -3 3 -2 10])
title('System of Multivariate Equations')
xlabel('x') 
ylabel('y') 
zlabel('z') 
vars=[x y];
range = [0 -2; 0 2];
[solx soly] = vpasolve(equations,vars,range)