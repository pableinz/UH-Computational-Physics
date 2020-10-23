#include <unsupported/Eigen/MatrixFunctions>
#include <iostream>
#include <iomanip>
#include <cmath>
#include <fstream>
#include <ctime>
#include <chrono> 
using namespace std;
using namespace std::chrono; 
using namespace Eigen;


int main()
{	
	clock_t time_req,start_time;
	
	auto start=std::chrono::steady_clock::now();
	start_time= clock();
	
	double d=0, tol=0;
	int n=500,k=1;
	MatrixXd A(n,n), Idm(n,n), ones(n,n), lnm(n,n), lnm_old(n,n);
	
	A=MatrixXd::Zero(n,n);
	lnm=MatrixXd::Zero(n,n);
	lnm_old=MatrixXd::Zero(n,n);
	Idm=MatrixXd::Identity(n, n);
	ones=MatrixXd::Constant(n,n,1.0);
	d=1/((float)(n)+1.0);
	
	//ofstream dfile("MT3matrix_n10cpp.csv");
	
	//std::cout <<"d is "<< d << std::endl;
	//std::cout <<"ones is "<<endl<< ones<< std::endl; 
	//std::cout <<"ones is "<<endl<< (Idm+Idm).pow(1)<< std::endl; 
	A=d*(Idm+ones);
	//std::cout <<"A before is "<<endl<< A.pow(1) << std::endl;
	
	tol=1e-3;

	while(1){
		lnm=lnm_old+pow(-1,k+1)*(A-Idm).pow(k)/k;
		
		if (n*(lnm-lnm_old).norm()<tol || k>5000){
			break;
		}
		lnm_old=lnm;
		k=k+1;
	}
	auto end=std::chrono::steady_clock::now();  //this the start timer
	auto timediff=std::chrono::duration_cast<std::chrono::microseconds>(end-start);
	
	time_req = clock()-start_time;
	
	//std::cout <<"lnm_old after is "<<endl<< lnm_old << std::endl;
	//std::cout <<"lnm after is "<<endl<< lnm << std::endl;
	
	std::cout <<"lnm_old norm after is "<<endl<< lnm_old.norm() << std::endl;
	std::cout <<"lnm norm after is "<<endl<< lnm.norm() << std::endl;
	std::cout <<"lnm-lnm_old norm after is "<<endl<< (lnm-lnm_old).norm() << std::endl;
	
	//dfile<<setprecision(12)<<lnm<<"\n";
	
	
	//dfile.close();
	std::cout <<"Iterations is "<< k << std::endl;
	cout <<"Old timer-Time required was "<<endl<<setprecision(8)<< (float)(time_req)<<" seconds"<< std::endl;
	cout<<"took "<<timediff.count()/1000000.0<<" s\n";
	return 0;
	
	
}

