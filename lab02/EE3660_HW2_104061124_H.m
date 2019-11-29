[x, Fs] = audioread('Halleluyah.wav');
sound(x,Fs);
t = [0:length(x)]/Fs;
constant = 40000;
tsub = t(1:constant);

%set initial value
%x(1:5000) = 0;

%first
tour1 = 0.05;
tour2 = 0.08;
D1 = round(tour1*Fs);  % D = tour*Fs
D2 = round(tour2*Fs);
%second
tour3 = 0.1;
tour4 = 0.16;
D3 = round(tour3*Fs);  % D = tour*Fs
D4 = round(tour4*Fs);
%third
tour5 = 0.5;
tour6 = 0.8;
D5 = round(tour5*Fs);  % D = tour*Fs
D6 = round(tour6*Fs);

%first
y1 = filter(1,[1 zeros(1,D1-2) -0.7],x);
y2 = filter(1,[1 zeros(1,D2-2) -0.5],x);
y12 = y1 + y2;
ysub12 = y12(1:constant);
%second
y3 = filter(1,[1 zeros(1,D3-2) -0.7],x);
y4 = filter(1,[1 zeros(1,D4-2) -0.5],x);
y34 = y3 + y4;
ysub34 = y34(1:constant);
%third
y5 = filter(1,[1 zeros(1,D5-2) -0.7],x);
y6 = filter(1,[1 zeros(1,D6-2) -0.5],x);
y56 = y5 + y6;
ysub56 = y56(1:constant);

figure
plot(tsub,ysub12,'g','linewidth',2);
hold
plot(tsub,ysub34,'r','linewidth',2);
plot(tsub,ysub56,'m','linewidth',2);
legend('50,80','100,160','500,800');
xlabel('time');
ylabel('Y[n]');
title('response');

sound(ysub56,Fs);
audiowrite('Halleluyah_56echo.wav',x,Fs);