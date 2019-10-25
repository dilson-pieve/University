% RZU e RZB

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

% (1) RZU

rzu = 0 * t2;

for i = 1:tam
    if(bin(i))
        rzu(2*i-1) = A;
    end
end

% (2) RZB

rzb = 0 * t2;

for i = 1:tam
    if(bin(i))
        rzb(2*i-1) = A;
    else 
        rzb(2*i-1) = -A;
    end
end

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

% ## RZU
subplot (323)
stairs (t2, rzu);
axis([0 (tam-1)*T -A-1 A+1])
title('RZU')

p=line([0 16],[0 0]);
p.Color = 'red';
p.LineStyle = '--';

subplot(324)
ft_spect(rzu, T)

% ## RZB
subplot (325)
stairs (t2, rzb);
axis([0 (tam-1)*T -A-1 A+1])
title('RZB')

p=line([0 16],[0 0]);
p.Color = 'red';
p.LineStyle = '--';

subplot(326)
ft_spect(rzb, T)





