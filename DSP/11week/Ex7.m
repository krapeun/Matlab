% Ex7

b = [1 0];
a = [1 -0.9];
zplane(b,a)

[H, w] = freqz(b, a, 100); % 디지털 필터의 주파수 응답
magH = abs(H); phaH = angle(H);
figure;
subplot(2,1,1); plot(w/pi, magH); grid
xlabel('frequency in pi unit'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2); plot(w/pi, phaH); grid
xlabel('frequency in pi unit'); ylabel('Phase in pi units');
title('Phase Response')
