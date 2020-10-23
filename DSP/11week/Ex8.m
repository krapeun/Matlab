% Ex8

b = [1, 0, -1];
a = [1, 0, -0.81];
[R, P, C] = residuez(b,a)

w = [0:1:500] * pi/500;
H = freqz(b, a, w);
magH = abs(H); phaH = angle(H);
subplot(2,1,1); plot(w/pi, magH); grid
xlabel('Frequency in pi unit'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2); plot(w/pi, phaH/pi); grid
