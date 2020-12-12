% EX3
clc; clear; close all;

h = [-4 1 -1 -2 5 0 -5 2 1 -1 4];
M = length(h); 
n = 0:1:M-1;
[Hr,w,c,L] = Hr_Type3(h);

subplot(2,2,1); stem(n,h);
xlabel('n'); ylabel('h(n)'); title('Impulse Response');

subplot(2,2,3); stem(0:L,c);
xlabel('n'); ylabel('c(n)'); title('Filter Coefficients');

subplot(2,2,2); plot(w/pi,Hr); grid;
xlabel('Freq in pi unit'); ylabel('Hr(w)'); title('Amplitude Response');

subplot(2,2,4); zplane(h,1);
