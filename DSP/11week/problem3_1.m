% Problem # 3-1

% 1 - a
n = [0:50];
x = ((0.8).^n).*stepseq(0, 0, 50);
ya = conv(x,x);
subplot(2,1,1); stem(ya); title('Problem 1-a')
axis([0,50,0,2.5]);
xlabel('n'); ylabel('x(n)*x(n)');

% 1 - b
yb = filter(1, [1, -0.8], x);
subplot(2,1,2); stem(yb); title('Problem 1-b')
axis([0,50,0,2.5]);
xlabel('n'); ylabel('x(n)*x(n)');
