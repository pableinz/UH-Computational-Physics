#include <iostream>
#include <fstream>
#include <math.h>

int main(){
	
	double x0=0.1; //initial population 
	double x=0; // population at time t
	int n_max=21; //parameter controlling \delta(\Delta t)
	double t=2.0;
	double delta_t=0.0;
	double Dt[n_max]={0.0};
	
	std::cout<<"x0 = "<<x0<<"\n";
	
	std::ofstream dfile("delta_t_cpp.txt");
	x=1/(1 + 9*exp(-t));
	
	for (int n=0;n<n_max;n++){
		Dt[n]=pow(10,(double)-n);	
		delta_t = abs(9*exp(-t)/pow((1+9*exp(-t)),2) - (1/Dt[n])*9*exp(-t)*(1-exp(-Dt[n]))/((1+9*exp(-t-Dt[n]))*(1+9*exp(-t))));
		
		dfile<<Dt[n]<<","<<delta_t<<"\n";
	}
	
	
	dfile.close();
	
	system("pause");
	
	return 0;
}
