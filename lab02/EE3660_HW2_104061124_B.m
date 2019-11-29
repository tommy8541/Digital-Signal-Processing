x = zeros(1,2000);
x(1) = 1;

y1 = filter(1,[1 zeros(1,348) -0.7],x);
y2 = filter(1,[1 zeros(1,558) -0.5],x);

y = y1+y2;
t = 1:2000;

stem(t,y,'r','linewidth',2);
xlabel('t');
ylabel('h[n]');
title('impulse response');