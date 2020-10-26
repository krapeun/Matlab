% 4.Z-Transform Problem # 1

n = [0:100];
% a
%x1 = (4/3).^n;
%x2 = stepseq(0, -1, 0);
xa = ((4/3).^n).*stepseq(0,0,0);
y = filter(4/3, [-3/4 1], x);
subplot(2,1,1); stem(n,y); title('Problem 1-a')
xlabel('n'); ylabel('x(n)');

% b
xb = 2.^(-abs(n)) + (1/3).^(abs(n));
y = filter(1, 1, x);
subplot(2,1,2); stem(n,y); title('Problem 1-b')
xlabel('n'); ylabel('x(n)');
