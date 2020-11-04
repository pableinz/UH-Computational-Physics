clear; 

%% * Initialize parameters (time step, grid points, etc.).
tau = 0.01; %input('Enter time step: ');
Nx = 100;    %input('Enter the number of x grid points: ');
Ny = 100;    %input('Enter the number of y grid points: ');
Lx = 100;    %input('Enter system x length: ');  
Ly = 100;    %input('Enter system y length: ');  
% The system extends from x=-L/2 to x=L/2
Dx = Lx/(Nx-1);  % Grid size
Dy = Ly/(Ny-1);
mu = 1.;   % parameter
coeffx = mu*tau/Dx^2;
coeffy = mu*tau/Dy^2;
if( coeffx < 0.5 &&coeffy <0.5)
  disp('Solution is expected to be stable');
else
  disp('WARNING: Solution is expected to be unstable');
end

%% * Set initial and boundary conditions.
lap = zeros(Nx,Ny);        % Initialize density to zero at all points
lap_new = zeros(Nx,Ny);    % Initialize temporary array used by FTCS

%% The boundary conditions are 

lap(1:Ny-1,:)=0;
lap(Ny,:)=1;

%% * Set up loop and plot variables.
xplot = (0:Nx-1)*Dx - Lx/2;   % Record the x scale for plots
yplot = (0:Ny-1)*Dy - Ly/2;
iplot = 1;                 % Counter used to count plots
nstep = input('Enter number of time steps: ');
nplots = 50;               % Number of snapshots (plots) to take
plot_step = nstep/nplots;  % Number of time steps between plots

%% * Loop over the desired number of time steps.
for istep=1:nstep  %% MAIN LOOP %%

  %* Compute the new density using FTCS scheme.
  lap_new(round(Ny/2)+1:Ny-1,round(Nx/2)+1:Nx-1) = lap_new(round(Ny/2)+1:Ny-1,round(Nx/2)+1:Nx-1) + ...
      coeffx*(lap(3:N) + lap(1:(N-2)) - 2*lap(2:(N-1))) + ...
	   coeffy*lap(2:(N-1));
  lap = lap_new;        % Reset temperature to new values
  
  %* Periodically record the density for plotting.
  if( rem(istep,plot_step) < 1 )   % Every plot_step steps
    nnplot(:,iplot) = lap(:);       % record nn(i) for plotting
    tplot(iplot) = istep*tau;      % Record time for plots
    nAve(iplot) = mean(lap);        % Record average density 
	 iplot = iplot+1;
	 fprintf('Finished %g of %g steps\n',istep,nstep);
  end
end

%% * Plot density versus x and t as a 3D-surface plot
figure(1); clf;
mesh(tplot,xplot,nnplot);
xlabel('Time');  ylabel('x');  zlabel('n(x,t)');
title('Neutron diffusion');

%% * Plot average neutron density versus time
figure(2); clf;
plot(tplot,nAve,'*');
xlabel('Time'); ylabel('Average density');
title(['L = ',num2str(L),'  (L_c = \pi)']);

%% * Plot
figure(3); clf;
plot(xplot,nnplot(:,1:3:iplot));
xlabel('x'); ylabel('nn(x,t)');
title('Neutron density at various times');
