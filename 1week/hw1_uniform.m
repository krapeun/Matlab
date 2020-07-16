% 1Week Hw1 12171788 박지은

N = 100;
R = 10;

U = rand(1,N)*(6-4) + 4;

X_sum = 0;
for i = 1:N
    X_sum = X_sum + U(i)/N;
end
X_sum

[M, X] = hist(U,R);
resol = X(2) - X(1); % 한 구간의 길이

pdf = M/N/resol;
cdf = cumsum(pdf*resol);

figure; hold on;
bar(X, pdf);
plot(X, cdf);
title('N = 10000');
