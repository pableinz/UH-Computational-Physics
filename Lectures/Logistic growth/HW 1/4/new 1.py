import numpy as np  
import math			

n=10 

matrix=np.zeros((n,n))	

for i in range(n):		
	for j in range(n):	
		matrix[i,j]=pow(abs(i-j),2)  #pow instead of power

for i in range(n):		#whole loop can be replaced with print(matrix)
	for j in range(n):	
		print(str(matrix[i,j])+" ",end="")	#+ instead of ,
	print("")