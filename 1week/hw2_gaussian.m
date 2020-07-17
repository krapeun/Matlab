% 1Week Hw2 12171788 박지은

N = 50000;
R = 100;
avg = 2;
stdev = sqrt(2);

T = randn(1, N);
G = T*stdev + avg;

X_sum = 0; % 평균
for i = 1:N
    X_sum = X_sum + G(i)/N;
end

X_stdev = 0; % 분산
for i = 1:N
    X_stdev = X_stdev + (G(i)-2)^2;
end
X_stdev = X_stdev/N
X_sum

[M, X] = hist(G,R);
resol = X(2) - X(1); % 한 구간의 길이

pdf = M/N/resol;
cdf = cumsum(pdf*resol);

x = -2:0.001:6;
f = 1/(sqrt(2)*sqrt(2*pi)) * exp((-1/2)*(x-2).^2/2^2);

figure; hold on;
bar(X, pdf);
plot(X, cdf);
plot(x, f);
title('Gaussian PDF/CDF');
