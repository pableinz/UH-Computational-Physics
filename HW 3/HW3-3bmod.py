import numpy as np
import matplotlib as mp
import matplotlib.pyplot as plt


import sys
sys.path.append('./NM4P/Python/nm4p/')  #this is required to import a module from outside of the current directory.
										# you may need to change this to have the code run on your computer!
										
from rk4 import rk4						#this imports rk4 from Garcia's github.  Note the file name 
										# is rk4 (the first "rk4" here), and we import the "rk4" function
										# (the second "rk4")
										
								
										
def deriv(X,z,param):
	return np.array([X[1],X[2],(1-6*X[0])*X[1]])  # this is dX/dt = deriv(X,t)

fig = plt.figure()
a1 = fig.add_subplot(1, 1, 1)										#note that this funny form is chosen to match Garcia's rk4 function
c=['r','g','b']
for dziter in range(3):
    dz=0.001*10**0

                            
    alfa=0.5
    beta=0.0
    gamma=-0.25
    Z=50.0
    #these are the parameters for our system



    niter=Z/dz
    #these are the parameters for our integrator


    X=np.array([0.0,0.0,0.0],dtype=float)  #where we will store the data at each timestep for euler / rk4
    sampleZ=np.asarray(range(int(niter)+1))*dz
    rk4Result=np.asarray([alfa])		#where we will store the data for plotting

    X[0]=alfa
    X[1]=beta
    X[2]=gamma

    z=0
    print("omega_0 = "+str(alfa))
    print("omega'_0 = "+str(beta))
    print("omega''_0 = "+str(gamma))

    for ziter in range(int(niter)):
        X=rk4(X,z,dz,deriv,[])
        rk4Result=np.append(rk4Result,[X[0]])  #store the value of theta we saw
        z=z+dz


    
a1.plot(sampleZ,rk4Result,color=c[dziter],label='rk4 dz='+str(dz))
a1.plot(sampleZ,1/(2*np.cosh(sampleZ/2)**2),color='k',label='Exact')
a1.plot(sampleZ,np.true_divide(rk4Result-1/(2*np.cosh(sampleZ/2)**2),rk4Result),color='g',label='percent error')
#a1.plot(sampleZ,rk4Result-1/(2*np.cosh(sampleZ/2)**2),'.y',label='rk4-analytic')

a1.legend(loc='upper right')
a1.set_xlabel('z')
a1.set_ylabel('w')
plt.title('Dz='+str(dz))
plt.tight_layout()
plt.savefig('HW3-3bdiff3.eps')
plt.show()	