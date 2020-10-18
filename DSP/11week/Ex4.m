% Ex4 z-transform

b = [0 1];
a = [3, -4, 1];
[R, p, C] = residuez(b,a) % R 유수, p pole, C 직접항
[b a] = residuez(R, p, C)
