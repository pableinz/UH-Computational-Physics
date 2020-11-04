%  schro - Program to solve the Schrodinger equation 
%  for a free particle using the Crank-Nicolson scheme
clear;    % Clear memory and print header

%% * Initialize parameters (grid spacing, time step, etc.)
N = 100;%input('Enter number of grid points: ');
L = 100;              % System extends from -L/2 to L/2
delx = L/(N-1);          % Grid size
x = delx*(0:N-1) - L/2;  % Coordinates  of grid points
D = input('Enter D: ');  % Natural units
C=1;
tau = 0.01;%input('Enter time step: ');

%% * Set up the Diffusion operator matrix
Diff = zeros(N);  % Set all elements to zero
coeff = D/(delx^2);
for i=2:(N-1)
  Diff(i,i-1) = coeff;
  Diff(i,i) = -2*coeff+C;  % Set interior rows
  Diff(i,i+1) = coeff;
end
% First and last rows for periodic boundary conditions
Diff(1,N) = coeff;   Diff(1,1) = -2*coeff+C; Diff(1,2) = coeff;
Diff(N,N-1) = coeff; Diff(N,N) = -2*coeff+C; Diff(N,1) = coeff;

%% * Compute the Crank-Nicolson matrix
dCN = ( inv(eye(N) - .5*tau*Diff) * (eye(N) + .5*tau*Diff) );
			 
%% * Initialize the wavefunction 
x0 = 0;          % Location of the center of the wavepacket
  % Average velocity of the packet
%k0 = velocity/D;       % Average wavenumber
sigma0 = L/20;   % Standard deviation of the wavefunction
Norm_rho = 1/(sqrt(sigma0*sqrt(pi)));  % Normalization
Rho = Norm_rho * exp(-(x'-x0).^2/(2*sigma0^2));%.*exp(i_imag*k0*x') 

%% * Plot the initial wavefunction
figure(1); clf;
plot(x,Rho,'-');
title('Initial neutron density');
xlabel('x');  ylabel('\rho(x)'); legend('initial');
drawnow; 
saveas(gcf,'HW6_1Periodic_init','epsc');
pause(1);

%% * Initialize loop and plot variables 
max_iter = input('Enter number of time steps: ');
plot_iter = max_iter/20;
p_plot(:,1) = Rho;     % Record initial condition
iplot = 1;
figure(2); clf;
axisV = [-L/2 L/2 0 max(p_plot)]; % Fix axis min and max

%% * Loop over desired number of steps (wave circles system once)
for iter=1:max_iter
	
  %* Compute new wave function using the Crank-Nicolson scheme
  Rho = dCN*Rho;  
  
  %* Periodically record values for plotting
  if( rem(iter,plot_iter) < 1 )   
    iplot = iplot+1;
    tplot(iplot) = iter*tau;
    p_plot(:,iplot) = Rho;
    hold on;
    plot(x,p_plot(:,iplot));     % Display snap-shot of P(x)
     xlabel('x'); ylabel('P(x,t)');
    title(sprintf('after %g iterations',iter));
    drawnow;
    saveas(gcf,'HW6_1Periodic_plots','epsc');

  end

end
%% * Plot probability versus position at various times
figure(3); clf;
mesh(tplot,x,p_plot);
xlabel('Time');  ylabel('x');  zlabel('P(x,t)');
title('Neutron diffusion');
saveas(gcf,'HW6_1Periodic_mesh','epsc');

%% * Plot probability versus position at various times
figure(4); clf;
plot(x,p_plot(:,1:3:iplot));
xlabel('x'); ylabel('P(x,t)');
title('Neutron density at various times');
saveas(gcf,'HW6_1Periodic_selplots','epsc');
   