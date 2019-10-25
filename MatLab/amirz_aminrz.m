% AMIRZ E AMINRZ

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

%(1)AMINRZ
aminrz = 0 * t;
flag = 1;

for i = 1:tam
    if (bin(i))
        if (flag)
            aminrz(i) = A;
            flag = 0;
        else
            aminrz(i) = -A;
            flag = 1;
        end
    end
end

%(2)AMIRZ

t2 = (0:T/2:tam*T-T/2);

amirz = 0 * t2;
flag = 1;

for i = 1:tam
    if (bin(i))
        if (flag)
            amirz(2*i-1) = A;
            flag = 0;
        else
            amirz(2*i-1) = -A;
            flag = 1;
        end
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

% ## AMINRZ
subplot (323)
stairs (t, aminrz);
axis([0 (tam-1)*T -A-1 A+1])
title('AMINRZ')

p=line([0 16],[0 0]);
p.Color = 'red';
p.LineStyle = '--';

subplot(324)
ft_spect(aminrz, T)

% ## AMIRZ
subplot (325)
stairs (t2, amirz);
axis([0 (tam-1)*T -A-1 A+1])
title('AMIRZ')

p=line([0 16],[0 0]);
p.Color = 'red';
p.LineStyle = '--';

subplot(326)
ft_spect(amirz, T)





