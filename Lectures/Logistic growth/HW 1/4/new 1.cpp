#include <iostream>  
#include <cstdlib>  
double squared(double x);  

#define N 10 

int main(){
	
	double matrix[10][10]={0}; 
	double value=0;
	for(int i=0;i<N;i++){  
		for(int j=0;j<N;j++){  //INCORRECTLY INCREASING i INSTEAD OF j
			value=(abs(i-j));  //VALUE WAS NOT INITIALIZED
			matrix[i][j]=squared(value);  // plug |i-j| into the matrix
		}
	}
	
	for(int i=0;i<N;i++){  
		for(int j=0;j<N;j++){  
			std::cout<<matrix[i][j]<<" ";  
		}
		std::cout<<"\n";
	}
	return 0;
}

double squared(double x){  //Wrong type, should be double instead of int
	return x*x;  
}
