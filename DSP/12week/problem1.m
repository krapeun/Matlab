% Ex1

n = 0:10;
x = ((0.9) * exp(j*pi/3)).^n;
%plot(n, x); grid
%xlabel('freqeuncy in pi units'); title('Magnitude Part'); ylabel('Magnitude')

k = -250:250;
w = (pi/250)*k;

%X = x*(exp(-j*pi/250)).^(n'*k); % fft의 정의 이용

X_fft = fft(x, length(k)); % fft함수 이용
X_fft = fftshift(X_fft); % X_fft = fftshift(fft(x)); 보통은 이런식으로
%X_fft = abs(X_fft);

magX = abs(X_fft); angX = angle(X_fft); % X_fft --> X
realX = real(X_fft); imagX = imag(X_fft);

subplot(2, 2, 1); plot(w/pi, magX); grid
xlabel('freqeuncy in pi units'); title('Magnitude Part'); ylabel('Magnitude')

subplot(2, 2, 3); plot(w/pi, angX); grid
xlabel('freqeuncy in pi units'); title('Angle Part'); ylabel('Radiance')

subplot(2, 2, 2); plot(w/pi, realX); grid
xlabel('freqeuncy in pi units'); title('Real Part'); ylabel('Real')

subplot(2, 2, 4); plot(w/pi, imagX); grid
xlabel('freqeuncy in pi units'); title('Imaginary Part'); ylabel('Imaginary')
