clear;  
%clear out any previous definitions
data=load('log_map150.txt');
N=150;
%import the data

f=figure;
%create a figure called f.

hold all
%the flag hold means we are going to add data to the plot, rather than replace data.  
% this is not necessary for this example, but may be needed when combining data.

set(f,'Visible','on');
%the chart will pop up if 'on' is selected.  You can use 'off' as well


%plot(data(1:N,2),data(1:N,3),'o-','MarkerSize',5,'color','blue');
plot(data(N+1:2*N,2),data(N+1:2*N,3),'x-','MarkerSize',5,'color','black');
plot(data(2*N+1:3*N,2),data(2*N+1:3*N,3),'-+','MarkerSize',5,'color','red');
% This is the actual plot.  Only the first two aruments are required, the others optional.
% '.' refers to the plot markers being points.  You can use '+', for example.
% 'MarkerSize',1 choses the size of the plot markers
% 'color','black' choses the color.  

title('xn vs iterations');
%writes to the top of the plot
legend('r=2.00','r=2.99','Location','southeast')
box on
%puts a box all around the plot (instead of just x-y axes)

ax=gca;
% gca means "get current axes".  If you wnat to modify the axes, this is how.

ax.FontSize=12;
%sets the font size for the axes

xlabel('iterations');
ylabel('x_n');
%labels the axes 

saveas(gcf,'logistic_map150','epsc');
%prints the figure to an eps file.  You should usually use eps instead of pdf if possible. 

hold off
