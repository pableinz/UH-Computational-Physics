import numpy as np
import matplotlib.pyplot as plt
np.random.seed(1)		
from collections import Counter

n=100000
T=10
dx=.1
vals=10/(1+9*np.random.random_sample(n));
plt.scatter(range(0,n),vals)
plt.show()
dist=Counter(((T*vals)//1))
dist=np.array(list(dist.items()))
dist[:,1]/=n/100


plt.scatter(range(0,n),vals)
plt.show()

plt.scatter(dist[:,0],dist[:,1],marker='o')
plt.scatter(dist[:,0],100/(dist[:,0]),marker='*')
plt.show()

plt.scatter(dist[:,0],dist[:,1],marker='o')
plt.scatter(dist[:,0],100/(dist[:,0]),marker='*')
plt.yscale('log')
plt.show()
