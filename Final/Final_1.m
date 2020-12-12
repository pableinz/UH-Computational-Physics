%  Program to solve the Fokker-Planck equation using a parameter f that
%  accounts for a constant force.
clear;  

%% * Initialize parameters (grid spacing, time step, etc.)
Nprime = 1000;   %input('Enter number of grid points: ');
N=Nprime+2;     %adding the ghost cells to apply Neummann BCs.
L = 100;        % System extends from -L/2 to L/2
delx = L/(N-1-2); % Grid cell size
x = delx*(0:N-1) - delx*(N-1)/2;  % Coordinates  of grid points
D = input('Enter D: ');  % diffusion coefficient. Larger means faster diffusion
zeta=1;            
f=1;               %force
tau =0.01;     %input('Enter time step: ');

%% * Set up the Hamiltonian operator matrix
FPdiff = zeros(N);  % Set all elements to zero
coeff = D/(delx^2);
for i=2:(N-1)
  FPdiff(i,i-1) = coeff+f/(2*zeta*delx);
  FPdiff(i,i) = -2*coeff;  % Set interior rows
  FPdiff(i,i+1) = coeff-f/(2*zeta*delx);
end
% First and last rows for Neummann BCs

%FPdiff(1,:) = FPdiff(3,:);
%FPdiff(N,:) = FPdiff(N-2,:);
FPdiff(1,1) = -2*coeff;
FPdiff(1,2) = 2*(coeff);
FPdiff(N,N) = -2*coeff;
FPdiff(N,N-1) = 2*(coeff);
%% * Compute the Crank-Nicolson matrix
dCN = ( inv(eye(N) - .5*tau*FPdiff) * (eye(N) + .5*tau*FPdiff) );
			 
%% * Initialize the function at t=0.
%I chose a Gaussian wave packet as the starting function, but a delta
%function will serve as well
x0 = 0;               % Location of the center of the wavepacket
sigma0 = L/20;           % Standard deviation of the wavefunction
Norm_rho = 1/(sqrt(sigma0*sqrt(pi)));  % Normalization
Rho = Norm_rho * exp(-(x'-x0).^2/(2*sigma0^2)); %to add velocity .*exp(i_imag*k0*x') 
der=diff(Rho);
der2=diff(Rho,2);
%% * Plot the initial density
figure(1); clf;
plot(x,Rho,'-');
hold all
plot(x(1:N-1)',der,'+');
plot(x(1:N-2)',der2,'o');
title('Initial density');
xlabel('x');  ylabel('\rho(x)'); legend('initial');
drawnow; 
saveas(gcf,'Final_1Neumann_init','epsc');
pause(1);
hold off
%% * Initialize loop and plot variables 
max_iter = input('Enter number of time steps(length of simulation): '); %choose for how long to run
plot_iter = max_iter/20; % How many plots we display
p_plot(:,1) = Rho;       % Record initial condition
iplot = 1;
figure(2); clf;
axisV = [-L/2 L/2 0 max(p_plot)]; % Fix axis min and max

%% * Loop over desired number of steps 
for iter=1:max_iter
  %* Compute new density function using the Crank-Nicolson scheme
  Rho = dCN*Rho;  
  %Diff(1,:) = Diff(3,:);
  %Diff(N,:) = Diff(N-2,:);
  %dCN = ( inv(eye(N) - .5*tau*Diff) * (eye(N) + .5*tau*Diff) );

  %* Periodically record values for plotting
  if( rem(iter,plot_iter) < 1 )   
        iplot = iplot+1;
        tplot(iplot) = iter*tau;
        p_plot(:,iplot) = Rho; 
        hold on;
        plot(x(2:N-1),p_plot(2:N-1,iplot)); % Display snap-shot of P(x)
        xlabel('x'); ylabel('P(x,t)');
        title(sprintf('after %g iterations',iter));
        drawnow;
        saveas(gcf,'Final_1Neumann_plots','epsc');

  end

end
%% * Plot drift Diffusion
figure(3); clf;
mesh(tplot,x,p_plot);
xlabel('Time');  ylabel('x');  zlabel('P(x,t)');
title('Drift Diffusion');
saveas(gcf,'Final_1Neumann_mesh','epsc');

%% * Plot density versus position at various times
figure(4); clf;
plot(x(2:N-1),p_plot(2:N-1,1:3:iplot));
xlabel('x'); ylabel('P(x,t)');
title('Profile at various times under drift diffusion');
saveas(gcf,'Final_1Neumann_selplots','epsc');