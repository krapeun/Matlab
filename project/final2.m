% Project 2 12171788 박지은


%% Parameter settings

% load file
loaded_file = load('project2.mat');

% parameters setting
y = loaded_file.y; % Received signal
N_OFDM_symbols = loaded_file.N_OFDM_symbols; % Number of OFDM symbol
nFFTSize = loaded_file.nFFTSize; % FFT Size
Subcarrier = loaded_file.nSubcarrier; % Number of Subcarrier
modOrder = loaded_file.modOrder; % Modulation Order
nSampGI = loaded_file.nSampGI; % Guard Interval
subcarrierIndex = loaded_file.subcarrierIndex; % Data mapping Subcarrier Index
N_ASCII_Bits = loaded_file.N_ASCII_Bits; % Number of ASCII Bits

symbol = 7; % Number of symbol


%% Receiver

for i = 1:symbol
    % Guard Interval(CP) Remove
    rx_sig = y(nSampGI + 1 + 2192*(i-1):2192*i);

    % Serial to Parallel
    rx_sig = rx_sig.';

    % FFT
    rx_fft = fft(rx_sig, nFFTSize)/sqrt(nFFTSize);

    % Data Demapping
    rx_demap = rx_fft(subcarrierIndex);

    % Parallel to Serial
    rx_demap = rx_demap.';

    % QPSK demodulation
    r = 2*(real(rx_demap)>0)-1 + 1j*(2*(imag(rx_demap)>0)-1);
    rx = [real(r)>0 imag(r)>0];
    rx = rx.';
    
    Data_bitstream_re(1 + 2400*(i-1):2400*i) = rx;
end


%% Binary Data to Text File

Data_bits_reshape = reshape(Data_bitstream_re,[length(Data_bitstream_re)/N_ASCII_Bits,N_ASCII_Bits]);

Data_ASCII_re_ = bi2de(Data_bits_reshape);

Data_re = char(Data_ASCII_re_')

