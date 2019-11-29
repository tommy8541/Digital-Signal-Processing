n = -5000:10000;

a1 = 0.7;
a2 = 0.5;

x = zeros(1,length(n));
x(n>=1) = 1;

y1 = filter(1,[1 zeros(1,348) -0.7],x);
y2 = filter(1,[1 zeros(1,558) -0.5],x);
ytot = y1+y2;

yss = (1/(1-a1)) + (1/(1-a2))*ones(1,length(ytot));
ytr = ytot - yss;

figure
plot(n,yss,'r','linewidth',2);
hold
plot(n,ytot,'g','linewidth',2);
plot(n,ytr,'m','linewidth',2);
legend('yss','y','ytr');
xlabel('n');
ylabel('y[n]');
title('red for yss/green for yss+ytr/pink for ytr');

%figure
%plot(n,ytr,'r','linewidth',2);
%xlabel('n');
%ylabel('h[n]');
%title('transient state response');