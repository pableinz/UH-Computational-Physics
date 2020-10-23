import numpy as np
from numpy.linalg import matrix_power
import time

nlist=np.array([10,20,50,100,200,500,1000,2000])
T=np.zeros((np.size(nlist),1))
for iter in range(np.size(nlist)):

    start= time.time()
    n=nlist[iter]
    Idm=np.identity(n)
    d=1/(n+1)
    A=d*(Idm+np.ones(n))
    tol=1e-3
    k=1
    lnm=np.zeros(n)
    lnm_old=np.zeros(n)
    while True:
        lnm=lnm_old+(-1)**(k+1)*matrix_power((A-Idm),k)/k
        if np.amax(abs(lnm-lnm_old))<tol:
            break
        elif k>2000:
            break
        lnm_old=lnm
        k=k+1
    T[iter]=time.time()-start

    print(np.matrix(lnm))
    print("It took: "+str(k)+" iterations")
    print("Elapsed: "+str(T[iter])+" seconds")

