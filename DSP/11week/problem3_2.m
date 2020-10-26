% Problem # 3-2

x = [1 2 3 4];
h = [3 2 1];

% 2 - a
ya = conv(h,x)

subplot(2,1,1); stem(ya); title('Problem 2-a')
xlabel('n'); ylabel('y(n)');

% 2 - b
a = [3 2 1];
b = [3; 2; 1];
x = [1; 2; 3; 4];

r = [a zeros(1, length(h))];
c = [a(1) zeros(1, length(h))];
H = toeplitz(r, c)
yb = H*x

subplot(2,1,2); stem(yb); title('Problem 2-b')
xlabel('n'); ylabel('x(n)*x(n)');
