% Discrete-time signal #Problem 1
n = -2:10;
x = [1:7,6:-1:1];

% Part a)
[a,n1] = sigshift(x,n,5);
[b,n2] = sigshift(x,n,-4);
[x1,n3] = sigadd(2*a,n1,-3*b,n2);
subplot(2,1,1);
stem(n3,x1);
title('Sequence in Example Problem 1) a')
xlabel('n'); ylabel('x(n)'); 
axis([min(n)-1,max(n)+1,min(x1)-1,max(x1)+1])

% Part b)
[a,n1] = sigfold(x,n);
[a,n1] = sigshift(a,n1,3);
[b,n2] = sigshift(x,n,2);
[b,n2] = sigmult(x,n,b,n2);
[x2,n4] = sigadd(a,n1,b,n2);

subplot(2,1,2); 
stem(n4,x2);
title('Sequence in Example Problem 1) b')
xlabel('n'); ylabel('x(n)'); 
axis([min(n)-1,max(n)+1,min(x2)-1,max(x2)+1])
