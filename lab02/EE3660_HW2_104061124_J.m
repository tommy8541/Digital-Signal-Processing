[x, Fs] = audioread('Halleluyah.wav');
sound(x,Fs);
x1 = x;
t = [0:length(x)-1]/Fs;
constant = 70000;  %for sampling a duration
tsub = t(1:constant);

for i = 1:20000    %use rand to determine initial
   x(i) = rand();
   y(i) = rand();
end

x1(1:20000) = 1; %set initial = 1
y(1:20000) = 1;

tour1 = 0.05;
tour2 = 0.08;
D1 = round(tour1*Fs);  % D = tour*Fs
D2 = round(tour2*Fs);

%rand
y1 = filter(1,[1 zeros(1,D1-2) -0.7],x);
y2 = filter(1,[1 zeros(1,D2-2) -0.5],x);
y = y1 + y2;
ysub = y(1:constant);

%initial = 1
y3 = filter(1,[1 zeros(1,D1-2) -0.7],x1);
y4 = filter(1,[1 zeros(1,D2-2) -0.5],x1);
y34 = y3 + y4;
y34sub = y34(1:constant);

%transient

figure
plot(tsub,ysub,'g','linewidth',2);
hold
plot(tsub,y34sub,'r','linewidth',2);
legend('rand','1');
xlabel('time');
ylabel('Y[n]');
title('response');

figure
plot(t,ytr,'g','linewidth',2);

sound(ysub,Fs);
audiowrite('Halleluyah_randecho.wav',x,Fs);