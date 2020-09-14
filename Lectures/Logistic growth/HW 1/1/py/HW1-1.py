import numpy as np
import math as m

# PARAMETERS

t=2.0

n_max=21
Dt=np.zeros(n_max)

delta_t=0.0
x=1/(1 + 9*np.exp(-t))

#open files


dfile=open('delta_t_python.txt','w')		#where to write delta t

#loop over n to find delta t
for iter in range(n_max):
    Dt[iter]=10.0**(-iter)
    delta_t = abs(9.0*np.exp(-t)/(1.0+9.0*np.exp(-t))**2.0 - (1.0/Dt[iter])*9.0*np.exp(-t)*(1.0-np.exp(-Dt[iter]))/((1.0+9.0*np.exp(-t-Dt[iter]))*(1.0+9.0*np.exp(-t))))
    
    dfile.write(str(Dt[iter])+","+str(delta_t)+"\n")

#close our files after writing

dfile.close();
