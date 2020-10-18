% Ex5

b = 1;
a = poly([0.9 0.9 -0.9]) % 해당 근을 가진 다항식
[R P C] = residuez(b,a)

[delta,n] = impseq(0, 0, 7);
x = filter(b, a, delta) % check sequence
x = (0.25)*(0.9).^n + (5/9)*(n+1).*(0.9).^(n+1) + (0.25)*(-0.9).^n
