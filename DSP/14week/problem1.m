% Problem1
clc; clear; close all;

% given condition
wp = 30; % passband edge frequency
ws = 40; % stopband edge frequency
Rp = 1; % passband ripple
As = 30; % stopband attenuation

Ripple = 10^(-Rp/20);
Attn = 10^(-As/20);

[b, a] = afd_butt(wp, ws, Rp, As);
% Analog LPF design using Butterworth

[C, B, A] = sdir2cas(b,a);
% Determine the system function in a cascade form

[db, mag, pha, w] = freqs_m(b,a,50);
% Calculation of Frequency Response

[ha, x, t] = impulse(b,a);
% Calculation of Impulse Response

subplot(2, 2, 1); plot(w/pi, mag); title('Magnitude Response');
xlabel('Analog frequency in pi units'); ylabel('|H|');
axis([0,15,0,1.1]); grid on; % plot the magnitue response

subplot(2, 2, 2); plot(w/pi, db); title('Magnitude Response in dB');
xlabel('Analog frequency in pi units'); ylabel('decibels');
axis([0,15,-60, 5]); grid on; % plot the log-magnitude response in dB

subplot(2, 2, 3); plot(w/pi, mag); title('Phase Response');
xlabel('Analog frequency in pi units'); ylabel('radians');
axis([0,16.2,-1,1]); grid on; % plot the magnitue response

subplot(2, 2, 4); plot(t, ha, [0,max(t)], [0,0]); title('Impulse Response');
xlabel('time in seconds'); ylabel('ha(t)');
axis([0,max(t), min(ha), max(ha)]); grid on; % plot the impulse response
