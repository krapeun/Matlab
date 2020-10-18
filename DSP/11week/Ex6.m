% Ex6

b = [1, 0.4*sqrt(2)];
a = [1, -0.8*sqrt(2), 0.64];
[R P C] = residuez(b,a)
Mp = abs(P') % pole magnitude
Ap = angle(P')/pi % pole angles in pi units

[delta, n] = impseq(0, 0, 6);
x = filter(b,a,delta) % check sequence
x = ((0.8).^n).*(cos(pi*n/4)+2*sin(pi*n/4)) % answer sequence
