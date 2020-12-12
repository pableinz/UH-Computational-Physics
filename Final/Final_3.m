clear;
rng(2,'twister');

N=50;
Tc=28000;
nstep=500000;
printstep=1;
nprint=floor(nstep/printstep);
ncorr=floor((nstep-10^4)/printstep);
nrun=100;
nmag=floor(nstep/Tc);
energy=zeros(nstep,1);
energy2=zeros(nstep,1);
t=zeros(nprint,1);
avm=zeros(nmag,1);
avmsq=zeros(nmag,1);
ave=zeros(nprint,1);
avesq=zeros(nprint,1);
corr=zeros(ncorr,1);
%where we store averages

J=0.3;
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
   
   if(run==1)
       figure
       hold on
       for i=1:N
            su=find(spins(i,:)==1);
            sd=find(spins(i,:)==-1);
            y=ones(length(su),1).*i;
            z=ones(length(sd),1).*i;
            scatter(su,y,20,'b','filled');
            scatter(sd,z,30,'rx');
        end
    pbaspect([1 1 1])
    title('spins initial configuration')
    legend(sprintf('up %g',length(find(spins==1))),sprintf('down %g',length(find(spins==-1))));
    saveas(gcf,'Final_3aJ03_initconfig','epsc');

   end
   
   
   e=get_init_energy(spins,J,b,N,pbc);
   %initialize the system:  spins and energies computed
   l=0;
   for step=1:nstep
      s1=floor(N*rand())+1;
      s2=floor(N*rand())+1;
      enew=e+energy_difference(s1,s2,spins,J,b,N,pbc);
       %try to flip a spin
      if(metropolis(e,enew))
          %use metropolis to accept or reject
         spins(s1,s2)=-spins(s1,s2);
         if(spins(s1,s2)>0)
            m=m+2; 
         else
             m=m-2;
         end
         e=enew;
         %update energy and magnetization if accepted
         energy(step)=enew;
         
         
      end
      if(run==1)
          energy2(step)=enew;
      end
      if(mod(step,printstep)==0)
          k=floor(step/printstep);
          t(k)=step;
          
          ave(k)=ave(k)+e/J/N/N;
          avesq(k)=avesq(k)+(e/J/N/N)*(e/J/N/N);
          fluct(k)=avesq(k)-ave(k)^2;
          %save the averages
      end
      
      if(step>=10^4&&mod(step,printstep)==0)
          
          
          
          if(step==10^4)
              mte=abs(m)./N^2;
          end
          if(step>10^4)
          l=l+1;
          tl(l)=step-10^4;
          mdopo(l)=abs(m);
          corr(l)=corr(l)+mte*abs(m);
          end
      end
         
      if(mod(step,Tc)==0)
       k2=floor(step/Tc);
       tk2(k2)=step;
          
      avm(k2)=avm(k2)+m/N/N;
      avmsq(k2)=avmsq(k2)+(m/N/N)*(m/N/N);
      end
   end
end

disp(spins)

figure
hold on
for i=1:N
    su=find(spins(i,:)==1);
    sd=find(spins(i,:)==-1);
    y=ones(length(su),1).*i;
    z=ones(length(sd),1).*i;
    scatter(su,y,20,'b','filled');
    scatter(sd,z,30,'rx');
end
pbaspect([1 1 1])
title('spins final configuration')
legend(sprintf('up %g',length(find(spins==1))),sprintf('down %g',length(find(spins==-1))));
saveas(gcf,'Final_3aJ03_finalconfig','epsc');


avefit=ave./nrun;
avmfit=avm./nrun;
mean(avmfit)
sigmam=(mean(avesq./nrun)-mean(avefit.^2))./sqrt(nrun)

corrfit=corr./nrun;
figure
plot(t,ave./nrun)
title('energy')
xlabel('iteration')
ylabel('<E>/JN^2')

saveas(gcf,'Final_3aJ03_ave','epsc');

figure
plot(t,avesq./nrun)
title('average energy^2')
xlabel('iteration')
ylabel('<E^2>/(JN^2)^2')
saveas(gcf,'Final_3aJ03_avesq','epsc');
figure
plot(t,(avesq./nrun-(ave./nrun).^2))
title('average fluctuations')
xlabel('iteration')
ylabel('fluct=(<E^2>-<E>^2)/(JN^2)^2')
saveas(gcf,'Final_3aJ03_efluct','epsc');



figure
plot(tk2,avm./nrun)
title('magnetization')
xlabel('iteration')
ylabel('<m>')

figure
plot(tl,corr./nrun)
title('magnetization fluctuations')
xlabel('iteration')
ylabel('corr(n)')


iter=1:1:nstep;
figure
hold on
plot(iter,energy2/(J*N^2),'x')
plot(iter,energy/(J*N^2),'.')

title('energy for first and last run')
xlabel('iteration')
ylabel('energy')
legend('first','last');
saveas(gcf,'Final_3aJ03_elastrun','epsc');

%metropolis criterion
function x=metropolis(e,enew)
   if(e>enew)
       x=true;
   else
       if(rand()<exp(-(enew-e)))
           x=true;
       else
           x=false;
       end
   end
end





%compute the energy of the system
function efinal=get_init_energy(spins,J,b,N,pbc)
    e=0;
    for i=1:(N-1)
       for j=1:(N-1)
          e=e-spins(i,j)*spins(i+1,j);
          e=e-spins(i,j)*spins(i,j+1);
          %bulk contribution, not needing to worry about pbc's
       end
    end
    

    for i=1:(N-1)
       e=e-spins(i,N)*spins(i+1,N);
       if(pbc)
            e=e-spins(i,N)*spins(i,1);
       end
    end
    % right side
    

    for j=1:(N-1)
        e=e-spins(N,j)*spins(N,j+1);
        if(pbc)
            e=e-spins(N,j)*spins(1,j);
        end
    end
    %bottom
    

    if(pbc)
        e=e-spins(N,N)*spins(N,1);
        e=e-spins(N,N)*spins(1,N);
    end
    %bottom right corner

    emag=0;
    for i=1:N
        for j=1:N
            emag=emag-spins(i,j);
        end
    end
    

    
    e=J*e+b*emag;
    efinal=e;
end


function de=energy_difference(s1,s2,spins,J,b,N,pbc)
    de=0;

    
    evaluate=true; 
    t1=s1+1;
    t2=s2;
    if(t1==N+1)
           if(pbc)
               t1=1;
           else
               evaluate=false;
           end
    end
    
    if(evaluate)
           de=de+2*spins(s1,s2)*spins(t1,t2);
    end
           
    evaluate=true; 
    t1=s1-1;
    t2=s2;
    if(t1==0)
           if(pbc)
               t1=N;
           else
               evaluate=false;
           end
    end
    
    if(evaluate)
           de=de+2*spins(s1,s2)*spins(t1,t2);       
    end      
    
           
    evaluate=true; 
    t1=s1;
    t2=s2+1;
    if(t2==N+1)
           if(pbc)
               t2=1;
           else
               evaluate=false;
           end
    end
    
    if(evaluate)
           de=de+2*spins(s1,s2)*spins(t1,t2);   
    end     
           
           
    evaluate=true; 
    t1=s1;
    t2=s2-1;
    if(t2==0)
           if(pbc)
               t2=N;
           else
               evaluate=false;
           end
    end
    
    if(evaluate)
           de=de+2*spins(s1,s2)*spins(t1,t2); 
    end
    
    de=de*J;
    if(spins(s1,s2)>0)
        de=de+2*b;
    else
        de=de-2*b;
    end
    
    
end
