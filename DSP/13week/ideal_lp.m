function hd = ideal_lp(wc,M);
alpha = (M-1)/2;
n = [0:1:(M-1)];
m = n - alpha + eps; % eps = 2.2204e-016
hd = sin(wc*m) ./ (pi*m);
