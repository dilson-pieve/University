function []=ft_spect(data,dt,mode)

if nargin<3
    mode = 'plot'; 
end
    

[~,n]=size(data);
if n~=1
    data=data'; % convert row signal (for example (1x100)) to column signal (100x1)
end

super_signal=data;    % Extending signal to infinity
for j=1:nextpow2(1000000/length(super_signal))
    super_signal=[super_signal; super_signal];
end

[m,~]=size(super_signal);
Fs =1/dt;                    % Sampling frequency
NFFT=100000;                 % For most signals, this resolution is enough
Y1 = 10*fftshift(fft(super_signal,NFFT))/(m);
f = Fs/2*linspace(-1,1,NFFT);

if(mode == 'plot')
    plot(f,2*abs(Y1(1:NFFT)));
else
    h = stem(f,2*abs(Y1(1:NFFT)));
    set(h,'marker','none')
end
xlabel('Frequência[Hz]');ylabel('Amplitude');


end