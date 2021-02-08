% Project 1 12171788 박지은


%% image settings

% load image
loaded_data = load('project1.mat');

% image parameters setting
Height_ = loaded_data.Height; % Height
Width_ = loaded_data.Width; % Width
CH_ = loaded_data.CH; % RGB channel
Level_binary = loaded_data.Level_binary; % # of required bits for pixel
h = loaded_data.h; % Rayleigh fading channel
y = loaded_data.y; % Received signal


%% BPSK demodulation

% channel equalization
rBPSK = (conj(h)./abs(h).^2).*y; % BPSK

% decoding
bit_stream_re_BPSK = real(rBPSK) > 0;


%% reconstruct image file

% construct bit matrix
image_bit_re_B = reshape(bit_stream_re_BPSK,[Height_*Width_*CH_,Level_binary]);

% binary to decimal
image_vec_re_B = bi2de(image_bit_re_B);

% image file vector to matrix
image_re_B = uint8(reshape(image_vec_re_B,[Height_,Width_,CH_]));


%% Image Plot

figure; imshow(image_re_B);
