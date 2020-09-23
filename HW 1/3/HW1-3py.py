import numpy as np

def GSO(a,b):
       v1=a
       dot_ab=np.dot(a,b)
       mod_a=np.sqrt(np.dot(a,a))
       mod_b=np.sqrt(np.dot(b,b))
       c=mod_b/np.sqrt((mod_b**2-dot_ab**2/mod_a**2))
       v2=(b-(dot_ab/mod_a**2)*a)*c
       
       print("a.b= "+str(dot_ab)+"\n")
       print("mod a= "+str(mod_a)+" , "+"mod b= "+str(mod_b)+"\n")
       print("c= "+str(c)+"\n")
       print("v1= "+str(v1)+" , "+"v2= "+str(v2)+"\n")
       print("mod v2= "+str(np.sqrt(np.dot(v2,v2)))+"\n")
       print("v1.v2= "+str(np.dot(v1,v2))+"\n")
    


a=np.array([1000,1,1])
b=np.array([1,2,3])


print("a= "+str(a)+" , "+"b= "+str(b)+"\n")
GSO(a,b)

