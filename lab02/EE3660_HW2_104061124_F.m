[x, Fs] = audioread('Halleluyah.wav');
sound(x,Fs);
t = [0:length(x)]/Fs;
tour1 = 0.05;
tour2 = 0.08;
a1 = 0.7;
a2 = 0.5;
D1 = round(tour1*Fs);  % D = tour*Fs
D2 = round(tour2*Fs);

y1 = filter(1,[1 zeros(1,D1-2) -0.7],x);
y2 = filter(1,[1 zeros(1,D2-2) -0.5],x);
y = y1+y2;

H5a1 = zeros(1,length(x));
H5a2 = zeros(1,length(x));
for i = 0:100
    H5a1(1+D1*i) = 1*(a1^i);
    H5a2(1+D2*i) = 1*(a2^i);
end

YFIR= conv(x,H5a1) + conv(x,H5a2);

figure
plot(t(1:40000),YFIR(1:40000),'r','linewidth',2);
hold
plot(t(1:40000),y(1:40000),'g','linewidth',2);
%plot(t(1:40000),x(1:40000),'m','linewidth',2);
%legend('YFIR','yIIR','input');
legend('YFIR','YIIR');
xlabel('time');
ylabel('Y[n]');
%title('FIR response');
title('IIR vs FIR');    
sound(YFIR,Fs);
audiowrite('Halleluyah_FIRecho.wav',x,Fs);