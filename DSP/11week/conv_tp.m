function [y,H]=conv_tp(h,x)
% Linear Convolution using Toeplitz Matrix
% ----------------------------------------
% [y,H] = conv_tp(h,x)
% y = output sequence in column vector form
% H = Toeplitz matrix corresponding to sequence h so that y = Hx
% h = Impulse response sequence in column vector form
% x = input sequence in column vector form
for i = 1:length(h)
    C(i) = h(i);
end
for j = (length(h) + 1):(length(x) + length(h) - 1)
    C(j) = 0;
end
R(1) = h(1);
for k = 2:length(x)
    R(k) = 0;
end
H = toeplitz(C,R);
y = H*x;
end
