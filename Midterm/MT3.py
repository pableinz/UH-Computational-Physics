import numpy as np
import random
import matplotlib as mp
import matplotlib.pyplot as plt
#from scipy import fft, ifft
from scipy.fftpack import fft,ifft
wall=60
signal=200

T=1
dt=0.001
noiseScale=.01




print("Data 1")  
data1np = np.genfromtxt("data.csv", delimiter=",", skip_header=0)
data1np.shape

xdata=np.array(data1np,dtype=np.float)

npoints=np.size(xdata)

np.size(xdata)
tvals=np.linspace(0,T,npoints)
transx=fft(xdata)
plt.plot(tvals,xdata,'-')
plt.show()
magx=np.abs(transx);
plt.plot(magx,'-')
plt.show()

ydata=np.zeros(np.size(xdata)+1,dtype=np.float)

for iter in range(np.size(xdata)-1):
    ydata[iter]= (xdata[iter]+ xdata[iter+1])/2

ydata[np.size(xdata)]=ydata[0]
tprime=np.linspace(0,T,npoints+1)
plt.plot(tprime,ydata,'-')
plt.show()
transy=fft(ydata)
magy=np.abs(transy);
plt.plot(magy,'-')
plt.show()
