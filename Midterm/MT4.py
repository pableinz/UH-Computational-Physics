import numpy as np
from numpy.linalg import matrix_power
from numpy import linalg as LA
import time
import csv

nlist=np.array([10])#20,50,100,200,500,1000,2000])
T=np.zeros((np.size(nlist),1))
for iter in range(np.size(nlist)):

    start= time.time()
    n=nlist[iter]
    Idm=np.identity(n)
    d=1/(n+1)
    A=d*(Idm+np.ones(n))
    tol=1e-8
    k=1
    lnm=np.zeros(n)
    lnm_old=np.zeros(n)
    while True:
        lnm=lnm_old+(-1)**(k+1)*matrix_power((A-Idm),k)/k
        if (n*LA.norm(lnm-lnm_old,'fro'))<tol:
            break
        elif k>2000:
            break
        lnm_old=lnm
        k=k+1
    T[iter]=time.time()-start
           
    print(np.matrix(lnm))
    print("It took: "+str(k)+" iterations")
    print("Elapsed: "+str(T[iter])+" seconds")
    np.savetxt("MT3matrix_n" + str(n) + "py.csv", np.matrix(lnm), delimiter=",")
       

