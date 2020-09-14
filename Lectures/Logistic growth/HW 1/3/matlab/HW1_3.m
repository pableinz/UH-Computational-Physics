clear;

a=[1,2,3];b=[0,2,4];
v1=a
v2=GSO(a,b)
fprintf("the modulus for b and v2 is %d\n",sqrt(sum(v2.*v2)));
fprintf("the dot product between v1 and v2 is %d\n",sqrt(sum(v1.*v2)));
%if one wants to orthonormalize
%uv1=v1/sqrt(sum(v1.*v1)) 
%uv2=v2/sqrt(sum(v2.*v2))
