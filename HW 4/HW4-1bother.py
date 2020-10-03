import numpy as np
from scipy import integrate
import matplotlib as mp
import matplotlib.pyplot as plt
import time

def deriv(t,R):
	return R*(a-R**2)
	return np.array([R[0]*(a-R[0]**2),-R[1]])
	
r0=1.5
theta0=0.1*np.pi
X=np.array([0.0,0.0],dtype=float)
X[0]=r0
X[1]=theta0
T=50.0
a=1.0
t=np.linspace(0, T, 10000);
t0=time.time();
#soln=integrate.solve_ivp(deriv,[0,T],X,args=(a))
soln=integrate.solve_ivp(deriv,[0,T],X,method='RK45',t_eval=t,atol=.0001)
tf=time.time();
print('took '+str(tf-t0)+' s')
print('answert is '+str(soln.t))
print('answery is '+str(soln.y))
print('y0 is '+str(soln.y[0]))
print('y1 is '+str(soln.y[1]))


plt.plot(soln.t,soln.y[0])
plt.plot(soln.t,soln.y[1])
plt.xlabel('t')
plt.ylabel('x(t)')
plt.show()
	
	

