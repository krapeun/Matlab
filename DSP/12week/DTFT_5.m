% Properties of DTFT # 5 Folding

clc; clear; close all;
n = -5:10; % sample index
x = rand(1, length(n)) + j*rand(1, length(n));

k = -100:100; w = (pi/100)*k; % for considering

% x = cos(pi*n/2); % signal
X = x * (exp(-j*pi/100)).^(n'*k); % x의 DTFT

% conjugation property
y = conj(x);
Y = y * (exp(-j*pi/100)).^(n'*k); % y의 DTFT

% verification
Y_check = conj(fliplr(X)); % conj(X(-w))
error = max(abs(Y-Y_check)) % difference
