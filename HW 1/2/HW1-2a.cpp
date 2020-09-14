#include <iostream>
#include <fstream>
#include <math.h>

int main(){
	
	int n=1; //initial integer
	int n_temp=0; //auxiliary variable to store the value of n and check for inconsistencies
	
	
	
	int i=0;
	while (1){
		n_temp=2*n;
		
	/* after runing the code without the following lines, the system displays zero instead of the correct number 
	and stays in an infinite loop. This means that there was an overflow. An easy fix was to find out when the 
	updated value of n gets smaller than the previous. This could never happen in f(n)=2^n for increasing n*/	
		if(n_temp<n){
			 	
			 break;
		}
		i=i+1;
		n=n_temp;
	std::cout<<"n = "<<n<<" = 2^"<<i<<"\n";
	}
	std::cout<<"The largest power of two representable in c++ is "<<n<<" = 2^"<<i<<"\n";
	
	system("pause");
	
	return 0;
}