#include <iostream>  //needed to print to the screen
#include <cstdlib> 
#include <iomanip>
double squared(double x);  //declare the function to compute a square

#define N 10 //size of the array

int main(){
	
	double matrix[N][N]={0.0}; //create an array
	double value=0.0;
	
	for(int i=0;i<N;i++){  //loop over i
		for(int j=0;j<N;j++){  //loop over j
			std::cout<<std::setw(10)<<std::fixed<<matrix[i][j];  //print the matrix to the terminal
		}
		std::cout<<"\n";//print a new line
	}
	
	for(int i=0;i<N;i++){  //loop over i
		for(int j=0;j<N;j++){  //loop over j
			value=((double)abs(i-j));  //compute |i-j|
			matrix[i][j]=squared(value);  // plug |i-j| into the matrix
		}
	}
	std::cout<<"\n";//print a new line
	for(int i=0;i<N;i++){  //loop over i
		for(int j=0;j<N;j++){  //loop over j
		std::cout<<std::setw(10)<<matrix[i][j];  //print the matrix to the terminal
		}
		std::cout<<"\n";//print a new line
	}
	system("pause");
	return 0;
}


double squared(double x){  //define the function to compute a square
	return x*x;  //compute x^2 and return it
}
