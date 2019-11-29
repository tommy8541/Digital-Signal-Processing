[x, Fs] = audioread('Halleluyah.wav');
sound(x,Fs);
t = [0:length(x)]/Fs;
constant = 40000;
tsub = t(1:constant);

x(1:5000) = 0;

tour1 = 0.05;
tour2 = 0.08;
D1 = round(tour1*Fs);  % D = tour*Fs
D2 = round(tour2*Fs);

y1 = filter(1,[1 zeros(1,D1-2) -0.7],x);
y2 = filter(1,[1 zeros(1,D2-2) -0.5],x);
y = y1 + y2;
ysub = y(1:constant);

figure
plot(tsub,ysub,'g','linewidth',2);
hold
plot(tsub,x(1:constant),'m','linewidth',2);
legend('output','input');
xlabel('time');
ylabel('Y[n]');
title('response for IIR');

sound(ysub,Fs);
audiowrite('Halleluyah_IIRecho.wav',x,Fs);