% Properties of DTFT # 4 Frequency Shifting

clc; clear; close all;
n = 0:100; % sample index
k = -100:100; w = (pi/100)*k; % for considering

x = cos(pi*n/2); % signal
X = x * (exp(-j*pi/100)).^(n'*k); % x의 DTFT

y = exp(j*pi*n/4).*x; % signal
Y = y * (exp(-j*pi/100)).^(n'*k); % y의 DTFT

magX = abs(X); angX = angle(X);
magY = abs(Y); angY = angle(Y);

subplot(2, 2, 1); plot(w/pi, magX); grid; axis([-1, 1, 0, 60]);
xlabel('freqeuncy in pi units'); title('Magnitude Part'); ylabel('Magnitude')

subplot(2, 2, 2); plot(w/pi, angX/pi); grid; axis([-1, 1, -1, 1]);
xlabel('freqeuncy in pi units'); title('Angle Part'); ylabel('Radiance')

subplot(2, 2, 3); plot(w/pi, magY); grid; axis([-1, 1, 0, 60]);
xlabel('freqeuncy in pi units'); title('Magnitude Part'); ylabel('Magnitudel')

subplot(2, 2, 4); plot(w/pi, angY/pi); grid; axis([-1, 1, -1, 1]);
xlabel('freqeuncy in pi units'); title('Angle Part'); ylabel('Radiance')
