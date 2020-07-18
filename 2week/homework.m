% 2주차 과제 1 12171788 박지은

%% 원신호 생성
f1 = 4; f2 = 2.5; % 원신호의 주파수 설정
A = 2; % 원신호의 진폭 설정

% 원신호와 sinc 함수의 discrete time 설정
T0 = 0.02;
t = [0:T0:2];
f0 = 1/T0;

x = A*cos(2*pi*f1*t) + cos(2*pi*f2*t); % 원신호


%% 샘플링 신호 생성

% 샘플링 주파수
fs = 6.2;
Ts = round(1/fs,2);
sample_step = floor(Ts/T0);
n = 0:2/Ts;
t_s(1) = t(1);
x_s(1) = x(1);

for i1 = 1:length(n) - 1
    t_s(i1 + 1) = t(1+i1*sample_step);
    x_s(i1 + 1) = x(1+i1*sample_step);
end
    

%% 복원 신호 생성

y_t = zeros(length(t_s), length(t));
for i1 = 1:length(t_s)
    y_t(i1,:) = x_s(i1)*sinc((t-(i1-1)*Ts)/Ts);
end
y = sum(y_t);

% 시간 영역에서 신호 그리기
subplot(2, 1, 1); plot(t(1:length(x)), [x]); hold on; plot(t_s, [x_s], 'o'); legend('Original', 'Sampling');
subplot(2, 1, 2); plot(t(1:length(x)), [x]); hold on; plot(t, [y]); legend('Original', 'Reconstruction');

% 주파수 영역에서 샘플링 신호 그리기
x_s2(1) = x(1);
t_s2(1) = t(1);
x_s2 = zeros(1, length(x));

for i1 = 2:length(t)
    if(mod(i1, sample_step) == 0)
        x_s2(i1) = x(i1);
    end
end
t_s2 = t;

FT_x = fft(x); FT_x_s = fft(x_s2); FT_y = fft(y);
ff1 = [0:length(FT_x)-1]*f0 / length(t);
ff2 = [0:length(FT_x_s)-1]*f0 / length(t);
ff3 = [0:length(FT_y)-1]*f0 / length(t);

figure(2);
subplot(3,1,1); stem(ff1,(abs(FT_x))); xlim([0,20]); grid on; legend('Original');
subplot(3,1,2); stem(ff2,(abs(FT_x_s))); xlim([0,20]); grid on; legend('Sampling');
subplot(3,1,3); stem(ff3,(abs(FT_y))); xlim([0,20]); grid on; legend('Reconstruction');
