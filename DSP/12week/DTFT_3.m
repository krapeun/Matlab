% Properties of DTFT # 3 Time Shifting

clc; clear; close all;
n1 = 0:10;
x1 = rand;
k = -500:500; w = (pi/250) * k; % 두 주기 동안의 변화 관찰

X1 = x1 * (exp(-j*pi/250)).^(n1'*k); % x1의 DTFT

% signal shifted by two samples
x2 = x1; n2 = n1 + 2;
X2 = x2 * (exp(-j*pi/250)).^(n2'*k); % x2의 DTFT

% verification
X_check = (exp(-j*2).^w).*X1; % X1을 주파수 영역에서 이동
error = max(abs(X2-X_check)) % difference
