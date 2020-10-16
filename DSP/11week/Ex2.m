% Ex2 filter function

a=[1,-1,0.9]; % 분모의 계수
b=1; % 분자

% Part a)
x=impseq(0,-20,120);
n=[-20:120];
h=filter(b,a,x);
subplot(2,1,1);stem(n,h)
axis([-20,120,-1.1,1.1])
title('Impulse Response');
xlabel('n'); ylabel('h(n)')

% Part b)
x=stepseq(0,-20,120);
s=filter(b,a,x);
subplot(2,1,2);stem(n,s)
axis([-20,120,-.5,2.5])
title('Step Response');
xlabel('n'); ylabel('s(n)')

% Part c)
sum(abs(h)) % 절댓값
z=roots(a); % 다항식의 근을 열 벡터로 반환
magz=abs(z)
