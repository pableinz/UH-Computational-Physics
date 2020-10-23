clear;

xdata=load('data.csv'); %load data from file 'data.csv'
T=1;  %sample time
dt=1/128;  %sampling rate 
tvals=(1:(T/dt))*dt;  %Creates a row vector with values from 0 to T with 1/dt divisions

transx=fft(xdata); %FFT of xdata
magx=abs(transx); %take the norm of the FFT of xdata

fxfft=figure;
plot(magx)
xlabel('frequency index (f in units of 1/dt)')
ylabel('X(f)')
saveas(gcf,'MT3_xFFT','epsc')

fx=figure;
plot(tvals,xdata,'.-')
xlabel('t (units of dt)')
ylabel('x(t)')
saveas(gcf,'MT3_xscatter','epsc')

for i=1:length(xdata)-1 %until N-1 due to the size limit in xdata
    yfiltrd(i)=(xdata(i)+xdata(i+1))/2;
end

yfiltrd(length(xdata))=yfiltrd(1); %periodic boundary conditions(BC)

transy=fft(yfiltrd);
magy=abs(transy);

fyfft=figure;
plot(magy)
xlabel('frequency index (f in units of 1/dt)')
ylabel('Y(f)')
saveas(gcf,'MT3_yFFT','epsc')

fy=figure;
plot(tvals,yfiltrd,'.-')
xlabel('t (units of dt)')
ylabel('y(t)')
saveas(gcf,'MT3_yscatter','epsc')

fxy=figure;
plot(tvals,xdata,'.-')
hold on
plot(tvals,yfiltrd,'.-')
xlabel('t (units of dt)')
ylabel('f(t)')
legend({'f(t) = x(t)','f(t) = y(t)'})
saveas(gcf,'MT3_Bothfigs','epsc')
hold off