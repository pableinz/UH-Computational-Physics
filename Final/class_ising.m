clear;
rng(2,'twister');

N=10;
nstep=500000;
printstep=5000;
nprint=floor(nstep/printstep)+1;
nrun=100;

t=zeros(nprint,1);
avm=zeros(nprint,1);
ave=zeros(nprint,1);

J=0.1;
b=0;
pbc=true;

for run=1:nrun
   spins=zeros(N,N);
   m=0;
   for i=1:N
        for j=1:N
            if(rand()<.5)
                spins(i,j)=1;
                m=m+1;
            else
                spins(i,j)=-1;
                m=m-1;
            end
        end
   end
   e=get_init_energy(spins,J,b,N,pbc);
   
   if(run==1)
        up=0;
        down=0;
    for i=1:N
        for j=1:N
            hold on
            if(spins(i,j)==1)
                plot(i,j,"ro")
                up=up+1;
            elseif(spins(i,j)==-1)
                plot(i,j,"bx")
                down=down+1;
            end
        end
    end
   legend(sprintf('down %g',down),sprintf('up %g',up));
   end
   for step=1:nstep
      s1=floor(N*rand())+1;
      s2=floor(N*rand())+1;
      enew=e+energy_difference(s1,s2,spins,J,b,N,pbc);
      if(metropolis(e,enew))
         spins(s1,s2)=-spins(s1,s2);
         if(spins(s1,s2)>0)
            m=m+2; 
         else
             m=m-2;
         end
      end
      e=enew;
      
      if(mod(step,printstep)==0)
          k=floor(step/printstep)+1;
          t(k)=step;
          avm(k)=avm(k)+abs(m)/N/N;
          ave(k)=ave(k)+e/J/N/N;
      end
   end
end
up=0;
down=0;
figure
for i=1:N
        for j=1:N
            hold on
            if(spins(i,j)==1)
                plot(i,j,"ro")
                up=up+1;
            elseif(spins(i,j)==-1)
                plot(i,j,"bx")
                down=down+1;
            end
        end
end
legend(sprintf('down %g',down),sprintf('up %g',up));

figure
plot(t,ave./nrun)
figure
plot(t,avm./nrun)


function x=metropolis(e,enew)
   if(e>enew)
       x=true;
   else
       if(rand()<exp(-(e-enew)))
           x=true;
       else
           x=false;
       end
   end
end


function e=get_init_energy(spins,J,b,N,pbc)
    e=0;
end


function de=energy_difference(s1,s2,spins,J,b,N,pbc)
    de=0;
end
