% Discrete-time signal #Problem 2
n = -20 : 20;

% Part a)

x = cos(0.3*pi*(n+1));
subplot(2,1,1);
stem(n,x); %plot(n, x); 
grid on;
xlabel('n');
title('Sequence in Example Problem 2) a')

% Part b)

x = cos(0.3*n);
subplot(2,1,2);
stem(n,x); %plot(n, x); 
grid on;
xlabel('n');
title('Sequence in Example Problem 2) b')
