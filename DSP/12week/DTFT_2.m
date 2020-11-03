% Properties of DTFT # 2 Linearity

clc; clear; close all;
n = 0:10;
x1 = rand; x2 = rand;
alpha = 2; beta = 3;

k = -500:500;
w = (pi/250)*k;

X1 = x1 * (exp(-j*pi/250)).^(n'*k); % x1의 DTFT
X2 = x2 * (exp(-j*pi/250)).^(n'*k); % x2의 DTFT

x = alpha*x1 + beta*x2; % linear combination of x1, x2
X = x * (exp(-j*pi/250)).^(n'*k); % x의 DTFT

% verification
X_check = alpha*X1 + beta*X2; % linear combination of X1, X2
error = max(abs(X-X_check)) % difference
