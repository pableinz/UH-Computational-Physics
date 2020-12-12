%  Program to solve the neutron diffusion equation using a parameter C that
%  accounts for chain reactions.
clear;  

%% * Initialize parameters (grid spacing, time step, etc.)
Nprime = 100;   %input('Enter number of grid points: ');
N=Nprime+2;     %adding the ghost cells to apply Neummann BCs.
L = 100;        % System extends from -L/2 to L/2
delx = L/(N-1-2); % Grid cell size
x = delx*(0:N-1) - delx*(N-1)/2;  % Coordinates  of grid points
D = input('Enter D: ');  % diffusion coefficient. Larger means faster diffusion
C=1;            % rate of neutron creation processes
tau = 0.01;     %input('Enter time step: ');

%% * Set up the Diffusion operator matrix
Diff = zeros(N);  % Set all elements to zero
coeff = D/(delx^2);
for i=2:(N-1)
  Diff(i,i-1) = coeff;
  Diff(i,i) = -2*coeff+C;  % Set interior rows
  Diff(i,i+1) = coeff;
end
% First and last rows for Neummann BCs
Diff(1,:) = Diff(3,:);
Diff(N,:) = Diff(N-2,:);

%% * Compute the Crank-Nicolson matrix
dCN = ( inv(eye(N) - .5*tau*Diff) * (eye(N) + .5*tau*Diff) );
			 
%% * Initialize the density function at t=0
%I chose a Gaussian wave packet as the starting function, but a delta
%function will serve as well
x0 = 0;                  % Location of the center of the wavepacket
sigma0 = L/20;           % Standard deviation of the wavefunction
Norm_rho = 1/(sqrt(sigma0*sqrt(pi)));  % Normalization
Rho = Norm_rho * exp(-(x'-x0).^2/(2*sigma0^2)); %to add velocity .*exp(i_imag*k0*x') 

%% * Plot the initial density
figure(1); clf;
plot(x,Rho,'-');
title('Initial neutron density');
xlabel('x');  ylabel('\rho(x)'); legend('initial');
drawnow; 
saveas(gcf,'HW6_1Neumann_init','epsc');
pause(1);

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
        saveas(gcf,'HW6_1Neumann_plots','epsc');

  end

end
%% * Plot Neutron diffusion
figure(3); clf;
mesh(tplot,x,p_plot);
xlabel('Time');  ylabel('x');  zlabel('P(x,t)');
title('Neutron diffusion');
saveas(gcf,'HW6_1Neumann_mesh','epsc');

%% * Plot neutron density versus position at various times
figure(4); clf;
plot(x(2:N-1),p_plot(2:N-1,1:3:iplot));
xlabel('x'); ylabel('P(x,t)');
title('Neutron density at various times');
saveas(gcf,'HW6_1Neumann_selplots','epsc');