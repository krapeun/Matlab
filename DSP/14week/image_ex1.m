clc; clear; close all;

filename = "park.jpg";
color_image = imread(filename); % RGB 이미지
[R,C,X] = size(color_image);
row = 1:R; col = 1:C; % 사이즈를 벡터로 표현

red_channel = color_image(row, col, 1); % R
green_channel = color_image(row, col, 2); % G
blue_channel = color_image(row, col, 3); % B
gray_image = rgb2gray(color_image); % RGB의 컬러 이미지를 Gray 이미지로

figure(1); % 각 채널에 해당하는 이미지 보기
subplot(2,3,1); imshow(color_image); title('Color'); % 컬러
subplot(2,3,2); imshow(gray_image); title('Gray'); % 흑백
subplot(2,3,4); imshow(red_channel); title('Red'); % red 채널
subplot(2,3,5); imshow(green_channel); title('Green'); % green 채널
subplot(2,3,6); imshow(blue_channel); title('Blue'); % blue 채널

red(R,C,1:3) = zeros;
green(R,C,1:3) = zeros;
blue(R,C,1:3) = zeros;

for i = 1:R
    for j = 1:C
        red(i, j, 1) = red_channel(i,j);
        green(i, j, 2) = green_channel(i,j);
        blue(i, j, 3) = blue_channel(i,j);
    end
end

figure(2); % 각 채널 이미지
subplot(2,3,1); imshow(color_image); title('Color'); % 컬러
subplot(2,3,2); imshow(gray_image); title('Gray'); % 흑백
subplot(2,3,4); imshow(uint8(red)); title('Red'); % red 채널
subplot(2,3,5); imshow(uint8(green)); title('Green'); % green 채널
subplot(2,3,6); imshow(uint8(blue)); title('Blue'); % blue 채널
% uint8 = 0~256 : 8비트의 부호 없는 정수형 배열


% LPF

f1 = fspecial('gaussian', [50,50], 50); % 지정된 2차원 필터 생성
G = filter2(f1, gray_image); % filtering

figure(3); imshow(gray_image); title('Gray');
figure(4); imshow(G/255); title('Gaussian');


% HPF

f2 = fspecial('laplacian');
L = filter2(f2, gray_image);
figure(5); imshow(L/255); title('Laplacian');


f3 = fspecial('prewitt');
P = filter2(f3, gray_image);
figure(6); imshow(P/255); title('Laplacian');
