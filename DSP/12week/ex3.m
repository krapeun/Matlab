% Ex3

w = [0:1:500]*pi/500;
% [0, pi] 구간 501 points w

X = exp(j*w)./(exp(j*w) - 0.5*ones(1,501));
% x(n) = (0.5)^n * u(n)에 대한 푸리에 변환

magX = abs(X); angX = angle(X);
realX = real(X); imagX = imag(X);

subplot(2, 2, 1); plot(w/pi, magX); grid
xlabel('freqeuncy in pi units'); title('Magnitude Part'); ylabel('Magnitude')

subplot(2, 2, 3); plot(w/pi, angX); grid
xlabel('freqeuncy in pi units'); title('Angle Part'); ylabel('Radiance')

subplot(2, 2, 2); plot(w/pi, realX); grid
xlabel('freqeuncy in pi units'); title('Real Part'); ylabel('Real')

subplot(2, 2, 4); plot(w/pi, imagX); grid
xlabel('freqeuncy in pi units'); title('Imaginary Part'); ylabel('Imaginary')
