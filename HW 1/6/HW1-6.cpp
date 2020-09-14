#include <iostream>
#include <fstream>
#include <math.h>

double logistic_calculate(double r, double x);


int main(){
	
	
	//	DEFINE PARAMETERS FOR THE CALCULATION
	
	int max_iteration=10000;  //number of iterations for values of x
	
	int max_period=256; 	//how many values we'll print....			 of what????
	int start_testing=max_iteration-max_period; //the iteration where it is time to start printing.
	int numdiv=5000;  //the number of values of r we will print.
	double tolerance=1e-8;  // this is what we mean by a "small" difference. Measures the difference between values of x corresponding to two iterations
	
	
	std::ofstream bfile("HWbifurcations.txt");  //bfile is the file we will print bifurcation data
	std::ofstream pfile("HWperiods.txt");  //outfile is the file we will print period data
	
	
	
	/*  ITERATE OVER numdiv (e.g. 5000) DIFFERENT VALUES OF r TO DETERMINE BIFURCATIONS */
	for(int riter=0;riter<numdiv;riter++){
		double r=1.0+14.0*((double)riter)/((double)numdiv);// r ranges from 1 to 15, with numdiv values chosen.
		
		
		//now that we have the parameters all chosen (the only parameter was r), we have to initalize our data.
		
		double x=0.001;  //initial value of x
		double xobs=0; //this is the stored value of x to see if there is a repeat.
		int period=max_period;  //this is the actual period for this system.		?????
		
		// iterate to find the evolution of x, there are max_iteration steps (e.g. 10000)
		for(int iter=0;iter<max_iteration;iter++){
			
			x=logistic_calculate(r,x);
			
			//when we reach the value at which we start testing
			if(iter==start_testing){
				//if we've waited "long enough", we check for repeats
				xobs=x;
				//	xobs is the observed value of the sequence that we will check for.
				bfile<<r;  //store the value of r for this calculation
			}
			//for each iteration after we started testing we print the values of x
			if(iter>start_testing){
				bfile<<","<<x;
				
				
				//to test how long does it take it to converge again to the first value we found.
				if((fabs(x-xobs)<tolerance) & (period==max_period)){
					//if we see a repeated value within our tolerance,
					period=iter-start_testing;
					//we store the period.
				}
			}
			
			
			
		}//end of the loop over iterations of x
		bfile<<"\n";
		pfile<<r<<","<<period<<"\n";
		
		
	}//end of loop over values of r.
	
	bfile.close();
	pfile.close();
	
	system("pause");
	
	return 0;
}

double logistic_calculate(double r, double x){
	return r*x/(1+x*x);
}
