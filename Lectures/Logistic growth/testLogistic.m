max_iterations=100;  % max number of iterations
  % how many numbers to print to the screen
r=1.4;  % our choice of r

% INITIALIZATION
x=.01;  %our initial value
t=[];
z=[];
% ITERATIONS
for iter=1:max_iterations
	t(iter)=iter;
    z(iter)=x;
    x=iter;
   
end  %end of iteration loop
t1=0:0.1:max_iterations;
z1=t1;
plot(t,z)
% in matlab, functions are defined at the end of the script, not the beginning.
%t they can be declared externally too, which we'll see later.

