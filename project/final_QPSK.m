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


%% QPSK demodulation

% channel equalization
r_ = (conj(h)./abs(h).^2).*y; % Rayleigh fading channel
rQPSK = 2 * (real(r_)>0) - 1  + 1j*(2*(imag(r_)>0)-1); % QPSK

% decoding
bit_stream_re_QPSK = [real(rQPSK)>0 imag(rQPSK)>0]; % QPSK
bit_stream_re_QPSK = bit_stream_re_QPSK';


%% reconstruct image file

% construct bit matrix
image_bit_re_Q = reshape(bit_stream_re_QPSK,[Height_*Width_*CH_,Level_binary]);

% binary to decimal
image_vec_re_Q = bi2de(image_bit_re_Q);

% image file vector to matrix
image_re_Q = uint8(reshape(image_vec_re_Q,[Height_,Width_,CH_]));


%% Image Plot

figure; imshow(image_re_Q);
