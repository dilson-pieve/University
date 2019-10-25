%NRZU e NRZ

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

%(1)NRZU
nrzu = A * bin;

%(2)NRZB
nrzb = bin;

for i = 1:tam
    if (bin(i))
        nrzb(i) = A;
    else
        nrzb(i) = -A;
    end
end
%end_NRZB

% PLOTS

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

% ## NRZU
subplot (323)
stairs (t, nrzu);
axis([0 (tam-1)*T -A-1 A+1])
title('NRZU')

p=line([0 16],[0 0]);
p.Color = 'red';
p.LineStyle = '--';

subplot(324)
ft_spect(nrzu, T)

% ## NRZB
subplot (325)
stairs (t, nrzb);
axis([0 (tam-1)*T -A-1 A+1])
title('NRZB')

p=line([0 16],[0 0]);
p.Color = 'red';
p.LineStyle = '--';

subplot(326)
ft_spect(nrzb, T)




