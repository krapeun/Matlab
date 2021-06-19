% 4week HW 12171788 박지은

%% Load wav file

% wav 파일을 읽고 원신호 생성
[x, f0] = audioread('Original.wav');

x = lowpass(x,3.800,f0); % Low-pass filtering

% 원신호의 시간 영역 설정
T0 = 1/f0;

t = [0:T0:10]; % 0~10초
x = x(1:length(t));


%% Sampling

% 샘플링 주파수
fs = 3000;
Ts = 1/fs;
sample_step = floor(Ts/T0);
sample_len = length(t)/sample_step;

ts = [0:Ts:10];

x_s = zeros(1, length(ts));
x_s(1) = x(1);

parfor i = 1:length(ts)
    x_s(i+1) = x(1+i*sample_step);
end

audiowrite('sampling.wav',x_s,fs)
%sound(x_s, fs)


%% Reconstruction

y = zeros(1, length(t)); % 초기화

tic;
parfor i = 1:length(ts) % 복원된 신호 sum
    y = y + x_s(i)*sinc((t-(i-1)*Ts)/Ts);
end
toc;

% 복원된 신호를 wav 파일에 저장
filename = char('reconstruction_fs_'+string(fs)+'Hz.wav');
audiowrite(filename, y, f0)


%% 주파수 영역에서 신호 확인

t_s2 = t;
x_s2 = zeros(1, length(x));
x_s2(1) = x(1);
for i1 = 2 :length(t)
    if(mod(i1,sample_step)==0)
        x_s2(i1) = x(i1);
    end
end

n1 = length(t);
f1 = [-n1/2:n1/2-1]*(f0/n1);

% FFT
FT_x = fft(x); FT_x_s = fft(x_s2); FT_y = fft(y);

% plot
figure;
subplot(3,1,1); plot(f1, 10*log10(abs(fftshift(FT_x)))); grid on; legend('Original');
subplot(3,1,2); plot(f1, 10*log10(abs(fftshift(FT_x_s)))); grid on; legend('Sampling');
subplot(3,1,3); plot(f1, 10*log10(abs(fftshift(FT_y)))); grid on; legend('Reconstruction');
