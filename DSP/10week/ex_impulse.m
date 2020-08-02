% Part a)
n = [-5:5];
x = 2*impseq(-2,-5,5)-impseq(4,-5,5);
subplot(2,1,1); stem(n,x); title('Sequence in Example a')
xlabel('n'); ylabel('x(n)'); axis([-5,5,-2,3])

% Part b)
n = [0:50];
x = cos(0.04*pi*n)+0.2*randn(size(n));
subplot(2,1,2);stem(n,x);title('Sequence in Example b')
xlabel('n');ylabel('x(n)');axis([0,50,-1.4,1.4])
