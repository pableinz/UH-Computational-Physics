#include <iostream>
#include <fstream>
#include <math.h>

#define n 3 //auxiliary variable for the dimensionality of the problem
void GSO(double a[],double b[],double v1[],double v2[]);

int main(){
	
	double a [n]={1,2,3}; //initial integer
	double b [n]={0,2,4};
	double v1 [n]={};
	double v2 [n]={};
	double modv2sq=0;
	std::cout<<"a = {";
	for(int i=0;i<n;i++){
	
		std::cout<<a[i];
		if(i!=n-1){
		std::cout<<",";
		}
	}
	std::cout<<"}"<<" ; ";
	std::cout<<"b = {";
	for(int i=0;i<n;i++){
	
		std::cout<<b[i];
		if(i!=n-1){
		std::cout<<",";
		}
	}
	std::cout<<"}"<<"\n";
	
	GSO(a,b,v1,v2);
	
	std::cout<<"v1 = {";
	for(int i=0;i<n;i++){
	
		std::cout<<v1[i];
		if(i!=n-1){
		std::cout<<",";
		}
	}
	std::cout<<"}"<<"\n";
	
	std::cout<<"v2 = {";
	for(int i=0;i<n;i++){
	
		std::cout<<v2[i];
		modv2sq+=v2[i]*v2[i];
		if(i!=n-1){
		std::cout<<",";
		}
	}
	std::cout<<"}"<<"\n";
	std::cout<<"mod v2 = "<<sqrt(modv2sq)<<"\n";
	system("pause");
	
	return 0;
}

void GSO(double a[],double b[],double v1[],double v2[]){
	double modsqA=0;
	double modsqB=0;
	double dotAB=0;
	double c=0;
	for(int i=0;i<3;i++){
		modsqA+=a[i]*a[i];
		modsqB+=b[i]*b[i];
		dotAB+=a[i]*b[i];
	}
	double modA=sqrt(modsqA);
	double modB=sqrt(modsqB);
	c=modB/sqrt(modsqB-dotAB*dotAB/modsqA);
	std::cout<<"mod A = "<<modA<<" , "<<"mod B = "<<modB<<"\n";
	std::cout<<"c = "<<c<<"\n";
	std::cout<<"producto punto de A y B = "<<dotAB<<"\n";
	
	for(int i=0;i<3;i++){	
		v1[i]=a[i];
		v2[i]=(b[i]-(dotAB/modA)*(a[i]/modA))*c;
	}
	
}