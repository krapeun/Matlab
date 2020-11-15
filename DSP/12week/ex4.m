% Ex4

n = -1:3; x = 1:5;
k = 0:500; w = (pi/500)*k;
% x(n) = {1, *2, 3, 4, 5}에 대한 푸리에 변환

X = x * (exp(-j*pi/500)).^(n'*k);
% n transpose * k = summation 보통은 for문으로 많이 쓰임

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

% plot(w/pi, atan2(imagX, realX)) --> angle과 imaginary가 동일하게 나옴
