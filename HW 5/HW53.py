import numpy as np
import random
import matplotlib as mp
import matplotlib.pyplot as plt
import pandas as pd
from scipy.optimize import curve_fit



def fitfunction(t,A,tau):
	return A*np.exp(-t/tau)
 
def fitfunction2(t,A,tau1,B,tau2):
	return A*np.exp(-t/tau1)+B*np.exp(-t/tau2)
 

print("Data 1")  
data1np = np.genfromtxt("data_1.csv", delimiter=",", skip_header=0)
data1np.shape
xdata1=np.array(data1np[:,0],dtype=np.float)
ydata1=np.array(data1np[:,1],dtype=np.float)
xdata1alt=data1np[:,0]
#yprint("X")
#print(xdata1)
#print("Y")
#print(ydata1)

#fit for data1
init_vals=[0,2]
fitd1f1,covd1f1=curve_fit(fitfunction,xdata1,ydata1,p0=init_vals)
print("fit1"+str(fitd1f1))
print("covf1"+str(covd1f1))
init_valsf2=[1,2,1,2]
fitd1f2,covd1f2=curve_fit(fitfunction2,xdata1,ydata1,p0=init_valsf2)
print("fit2"+str(fitd1f2))
print("covf2"+str(covd1f2))

plt.scatter(xdata1,ydata1)
plt.plot(xdata1,fitfunction(xdata1,*fitd1f1))
plt.plot(xdata1,fitfunction2(xdata1,*fitd1f2))
plt.show()


print("Data 2") 
data2np = np.genfromtxt("data_2.csv", delimiter=",", skip_header=0)
data2np.shape
xdata2=np.array(data2np[:,0],dtype=np.float)
ydata2=np.array(data2np[:,1],dtype=np.float)


#fit for data2
init_vals=[0,2]
fitd2f1,covd2f1=curve_fit(fitfunction,xdata2,ydata2,p0=init_vals)
print("fit1"+str(fitd2f1))
print("covf1"+str(covd2f1))
init_valsf2=[1,2,1,2]
fitd2f2,covd2f2=curve_fit(fitfunction2,xdata2,ydata2,p0=init_valsf2)
print("fit2"+str(fitd2f2))
print("covf2"+str(covd2f2))
plt.scatter(xdata2,ydata2)
plt.plot(xdata2,fitfunction(xdata2,*fitd2f1))
plt.plot(xdata2,fitfunction2(xdata2,*fitd2f2))
plt.show()

print("Data 3") 
data3np = np.genfromtxt("data_3.csv", delimiter=",", skip_header=0)
data3np.shape
xdata3=np.array(data3np[:,0],dtype=np.float)
ydata3=np.array(data3np[:,1],dtype=np.float)


#fit for data2
init_vals=[0,2]
fitd3f1,covd3f1=curve_fit(fitfunction,xdata3,ydata3,p0=init_vals)
print("fit1"+str(fitd2f1))
print("covf1"+str(covd2f1))
init_valsf2=[1,2,1,2]
fitd3f2,covd3f2=curve_fit(fitfunction2,xdata3,ydata3,p0=init_valsf2)
print("fit2"+str(fitd3f2))
print("covf2"+str(covd3f2))
plt.scatter(xdata3,ydata3)
plt.plot(xdata3,fitfunction(xdata3,*fitd3f1))
plt.plot(xdata3,fitfunction2(xdata3,*fitd3f2))
plt.show()
