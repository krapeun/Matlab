% EX1
clc; clear; close all;

%{ amplitude response Hr(w), H(z) h가 11개, 홀수면서 대칭 -> Type 1%}

h = [-4 1 -1 -2 5 6 5 -2 -1 1 -4];
M = length(h);
n = 0:1:M-1;
[Hr, w, a, L] = Hr_Type1(h);

subplot(2,2,1); stem(n,h);
xlabel('n'); ylabel('h(n)'); title('Impulse Response');

subplot(2,2,3); stem(0:L,a);
xlabel('n'); ylabel('a(n)'); title('Filter Coefficients');

subplot(2,2,2); plot(w/pi,Hr); grid;
xlabel('Freq in pi unit'); ylabel('Hr(w)'); title('Amplitude Response');

subplot(2,2,4); zplane(h,1);
