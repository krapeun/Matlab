% 1Week Gaussian 12171788 ¹ÚÁöÀº

N = 50000;
R = 100;
avg = 0;
stdev = sqrt(2);

T = randn(1, N);
G = T*stdev + avg;

[M, X] = hist(G,R);
resol = X(2) - X(1); % length of one section

pdf = M/N/resol;
cdf = cumsum(pdf*resol);

figure(1); hold on;
bar(X, pdf); plot(X, cdf);
title('Gaussian PDF/CDF');
