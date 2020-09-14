clear;  
%clear out any previous definitions
data=load('delta_t_py.txt');
%import the data

f=figure;
%create a figure called f.

hold all
%the flag hold means we are going to add data to the plot, rather than replace data.  
% this is not necessary for this example, but may be needed when combining data.

set(f,'Visible','on');
%the chart will pop up if 'on' is selected.  You can use 'off' as well


plot(data(:,1),data(:,2),'*','MarkerSize',5,'color','red');
% This is the actual plot.  Only the first two aruments are required, the others optional.
% '.' refers to the plot markers being points.  You can use '+', for example.
% 'MarkerSize',1 choses the size of the plot markers
% 'color','black' choses the color.  

title('Roundoff error (\delta) vs step size(\Delta t)');
%writes to the top of the plot
legend('py');

box on
%puts a box all around the plot (instead of just x-y axes)

ax=gca;
% gca means "get current axes".  If you wnat to modify the axes, this is how.

ax.FontSize=12;
%sets the font size for the axes
set(ax,'Xscale','log')
set(ax,'Yscale','log')

xlabel('\Delta t');
ylabel('\delta(\Delta t)');
%labels the axes 

saveas(gcf,'delta_tpy','epsc');
%prints the figure to an eps file.  You should usually use eps instead of pdf if possible. 

hold off
