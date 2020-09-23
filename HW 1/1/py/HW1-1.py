import numpy as np
import math as m
import matplotlib.pyplot as plt
# PARAMETERS

t=2.0

n_max=21
Dt=np.zeros(n_max)

delta_t=np.zeros(n_max)
x=1.0/(1.0 + 9.0*np.exp(-t))

#open files


dfile=open('delta_t_python.txt','w')		#where to write delta t

#loop over n to find delta t
for iter in range(n_max):
    Dt[iter]=10.0**(-iter)
    delta_t[iter] = abs(9.0*np.exp(-t)/(1.0+9.0*np.exp(-t))**2.0 - (1.0/Dt[iter])*9.0*np.exp(-t)*(1.0-np.exp(-Dt[iter]))/((1.0+9.0*np.exp(-t-Dt[iter]))*(1.0+9.0*np.exp(-t))))
    
    dfile.write(str(Dt[iter])+","+str(delta_t[iter])+"\n")

#close our files after writing

dfile.close();
plt.plot(Dt,delta_t,'ro')
plt.xscale('log')
plt.yscale('log')
plt.tight_layout()
plt.show()