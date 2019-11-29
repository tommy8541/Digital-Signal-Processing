[x, Fs] = audioread('Halleluyah.wav');
sound(x,Fs);
t = [0:length(x)]/Fs;
constant = 40000;
tsub = t(1:constant);

%set initial
x(1:1000) = 0;

tour1 = 0.05;
tour2 = 0.08;
D1 = round(tour1*Fs);  % D = tour*Fs
D2 = round(tour2*Fs);

y1 = filter(1,[1 zeros(1,D1-2) -1.5],x);
y2 = filter(1,[1 zeros(1,D2-2) -1.2],x);
y = y1 + y2;
ysub = y(1:constant);

figure
plot(tsub,ysub,'g','linewidth',2);
legend('unstable');
xlabel('time');
ylabel('Y[n]');
title('response');

sound(ysub,Fs);
audiowrite('Halleluyah_unstableecho.wav',x,Fs);