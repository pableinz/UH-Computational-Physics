import numpy as np
import matplotlib as mp
import matplotlib.pyplot as plt


import sys
sys.path.append('./NM4P/Python/nm4p/')  #this is required to import a module from outside of the current directory.
										# you may need to change this to have the code run on your computer!
										
from rka import rka						#this imports rk4 from Garcia's github.  Note the file name 
										# is rk4 (the first "rk4" here), and we import the "rk4" function
										# (the second "rk4")
										
								
										
def deriv(X,t,param):
	return np.array([param*X[0](1-X[0]**2),-1])  # this is dX/dt = deriv(X,t)
											#note that this funny form is chosen to match Garcia's rk4 function
							
										

def euler(X,t,tau,derivs,params):		#this defines the euler update.  Pretty easy to code, but remember it's innacurate
	return X+tau*deriv(X,t,params)		#the function definition matches rk4







r=0.5
theta=0.1*np.pi
t=0.0
T=30.0
a=0.1
#these are the parameters for our system


dt=0.01
niter=T/dt
#these are the parameters for our integrator


X=np.array([0.0,0.0],dtype=float)  #where we will store the data at each timestep for euler / rk4
print("X is: "+str(X))
sampleTimes=np.asarray(range(int(niter)+1))*dt
print("sampleTimes is: "+str(sampleTimes))

rkaResultr=np.asarray([r])		#where we will store the data for plotting
rkaResulttheta=np.asarray([r])
print("rkarinit is: "+str(rkaResultr))
print("rkathetainit is: "+str(rkaResulttheta))
	
	
	
	
X[0]=r
X[1]=theta
t=0
err=1.0e-2

for titer in range(int(niter)):
    X=rka(X,t,dt,err,deriv,a)
    rkaResultr=np.append(rkaResultr,[X[0]])  #store the value of theta we saw
    rkaResulttheta=np.append(rkaResulttheta,[X[0]])
    t=t+dt

	
	



fig,(a1,a2)=plt.subplots(1,2)


a1.plot(sampleTimes,rkaResultr,color='r',label='rka r')


ax1=a1.axes

a1.legend(loc='lower left')
a1.set_xlabel('t')
a1.set_ylabel('r')
a2.plot(sampleTimes,rkaResulttheta,color='b',label='rka theta')
plt.tight_layout()
plt.show()	
