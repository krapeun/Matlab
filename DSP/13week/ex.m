clc; clear; close all;

% figure 1
fs = 200; % 샘플링 주파수 200Hz
ts = 1/fs; % 샘플링 주기
dt = 0 : ts : 5-ts; % time vector, 0부터 해당 구간까지

f1 = 1; f2 = 20; f3 = 30;

y = 5*sin(2*pi*f1*dt) + 5*sin(2*pi*f2*dt) + sin(2*pi*f3*dt);
% 3가지 주파수 성분을 갖는 신호 예제 (Time domain)
figure(1); plot(dt,y); % 생성한 신호 확인

% figure 2
nfft = length(y); % 1000
nfft2 = 2.^nextpow2(nfft); % 1024
% nextpow2 : 인자의 2의 최소 거듭제곱 지수를 반환

fy = fft(y,nfft2); % y에 대한 magnitude와 phase 반환
fy = fy(1:nfft2/2);

xfft = fs.*(0:nfft2/2 - 1)/nfft;
figure(2); plot(xfft, abs(fy/max(fy))); % normalizing 결과

% figure 3
% LPF를 위한 H(f) 설계
cut_off = 5/fs/2;
order = 16;
h = fir1(order, cut_off);

con = conv(y, h); % y와 h를 convolution
figure(3);
subplot(3,1,1); plot(dt,y);
subplot(3,1,2); stem(h);
subplot(3,1,3); plot(con);

% figure 4
fh = fft(h, nfft2);
fh = fh(1:nfft2/2);
mul = fh.*fy;
con = conv(y,h);

figure(4);
subplot(3,2,1); plot(dt,y);
subplot(3,2,3); stem(h);
subplot(3,2,5); plot(con);

subplot(3,2,2); plot(abs(fy/max(fy))); % magnitude에 대한 normalizing
subplot(3,2,4); plot(abs(fy/max(fh)));
subplot(3,2,6); plot(abs(mul/max(mul)));
