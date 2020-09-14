#include <iostream>
#include <fstream>
#include <math.h>

int main(){
	
	double x=1.0; //initial integer
	double x_temp=0; //auxiliary variable to store the value of n and check for inconsistencies
	
	int i=0;
	while (1){
		x_temp=2.0*x; 
		
	/* after runing the code without the system displays inf instead of the correct number 
	and stays in an infinite loop. This means that there max allowed number was exceeded and 
	no more computations can be carried out. 	*/	
	
	/* Running the following fix allows us to find the max number that can be represented in c++
	without entering the infinite loop */
		if (x_temp==x){
		break;
		}
		i=i+1; //this is just a counter, representing the exponent in 2^n
		x=x_temp; //this copies the value of n_temp to n
	std::cout<<"x = "<<x<<" = 2^"<<i<<"\n";
	}
	std::cout<<"The largest power of two representable in c++ is "<<pow(2,i-1)<<" = 2^"<<i-1<<"\n";
	
	system("pause");
	
	return 0;
}