import numpy as np  #import numpy, for arrays
import math			#import math, for power and abs

n=10 #size of the arrays

matrix=np.zeros((n,n))	#create an array of zeros of size n
print(matrix)
print("")

for i in range(n):		#loop over i
	for j in range(n):	#loop over j
		matrix[i,j]=pow(abs(i-j),2)  #compute |i-j|^2
print(matrix)
