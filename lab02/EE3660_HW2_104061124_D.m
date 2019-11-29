n = -5000:7000;

x = zeros(1,length(n));
x(n>=1) = 1;

x1 = zeros(1,length(n));

y1 = filter(1,[1 zeros(1,348) -0.7],x);
y1(n<=1) = 0;
y2 = filter(1,[1 zeros(1,558) -0.5],x);
y2(n<=1) = 0;

y3 = filter(1,[1 zeros(1,348) -0.7],x1);
y4 = filter(1,[1 zeros(1,558) -0.5],x1);


y = y1+y2;
y(n<=1) = 0;
y = y-0;

Y = y3+y4;

figure
plot(n,y,'r','linewidth',2);
xlabel('n');
ylabel('h[n]');
title('zero state response');

figure
plot(n,Y,'r','linewidth',2);
xlabel('n');
ylabel('h[n]');
title('zero input response');