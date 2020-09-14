x=1.0
x_temp=0.0
i=0
while i<10000:
    x_temp=2.0*x
    
    if x_temp==x:
        break
    
    i=i+1
    x=x_temp
    if i%200==0:
        print(str(x)+"/n")
        
    
print("The largest power of two representable in Python by a double is "+str(2**(i-1))+" = 2^"+str(i-1)+'\n')

y=1
y_temp=0
j=0
while j<10000:
    y_temp=2*y
    
    if y_temp==y:
        break
    
    j=j+1
    y=y_temp
    if j%200==0:
        print(str(y)+"/n")
        
    
print("The largest power of two representable in Python by a double is "+str(2**(j-1))+" = 2^"+str(j-1)+'\n')
