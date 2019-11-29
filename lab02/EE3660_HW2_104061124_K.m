[x, Fs] = audioread('Halleluyah.wav');
sound(x,Fs);
t = [0:length(x)-1]/Fs;
constant = 70000;  %for sampling a duration
tsub = t(1:constant);

xzi = x;
xzs = x;
tour1 = 0.05;
tour2 = 0.08;
D1 = round(tour1*Fs);  % D = tour*Fs
D2 = round(tour2*Fs);

y = filter(1,[1 zeros(1,D1-2) -0.7],x) + filter(1,[1 zeros(1,D2-2) -0.5],x);

%zero input and i set n=20000
xzi(20001:length(x)) = 0;
yzi = filter(1,[1 zeros(1,D1-2) -0.7],xzi)+filter(1,[1 zeros(1,D2-2) -0.5],xzi);

%zero state and i set n=20000
xzs(1:20000) = 0;
yzs = filter(1,[1 zeros(1,D1-2) -0.7],xzs)+filter(1,[1 zeros(1,D2-2) -0.5],xzs);

figure
plot(t,y,'g','linewidth',2);
hold
plot(t,yzi,'r','linewidth',2);
plot(t,yzs,'b','linewidth',2);
legend('y','yzi','yzs');
xlabel('time');
ylabel('Y[n]');
title('response');
