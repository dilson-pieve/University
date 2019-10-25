% Biphase-S e bipolar

% ##DEFAULT %
clear
close all
clc

A = 5;
bin = [1,0,0,1,1,0,0,0,1,1,1,0,1,0,1,0];
tam = length(bin);

%period
f = 1;
T = 1/f;
t = (0:T:tam*T - T);
%

% ##END_DEFAULT

t2 = (0:T/2:T * tam-0.5 * T);

% BIPHASE-S
% 1? 1    0? 1/2 (0) e 1/2 (1)

biph = 0 * t2;

for i = 1:tam
    if(bin(i))
        biph(2*i)   = A;
        biph(2*i-1) = A;
    else
        biph(2*i)=A;
    end
end

%Bipolar

cnt = 1;
bipolar = 0 * t;

for i = 1:tam
    if (bin(i))
        r_div = mod(cnt, 2);
        if (r_div)
            bipolar(i) = A;
        else
            bipolar(i) = -A;
        end
        cnt = cnt + 1;
    else
        bipolar(i) = 0;
    end
end

%ENTRADA
subplot (311)
stairs (t, bin)
axis([0 (tam-1)*T -2 2])
title('CÓDIGO BINÁRIO')

%[x1 x2] [y1 y2]
p=line([0 16],[0 0]);
p.Color = 'red';
p.LineStyle = '--';
axis([0 (tam-1)*T -2 2])

%END_ENTRADA

% ## Biph-S
subplot (323)
stairs (t2, biph);
axis([0 (tam-1)*T -A-1 A+1])
title('Biph-S')

p=line([0 16],[0 0]);
p.Color = 'red';
p.LineStyle = '--';

subplot(324)
ft_spect(biph, T)


% ## BIPOLAR
subplot (325)
stairs (t, bipolar);
axis([0 (tam-1)*T -A-1 A+1])
title('Bipolar')

p=line([0 16],[0 0]);
p.Color = 'red';
p.LineStyle = '--';

subplot(326)
ft_spect(bipolar, T)


