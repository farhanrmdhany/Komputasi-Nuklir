%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Program Utama;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;clc;clf;

%Banyak segmen
n = input('Masukan jumlah segment (n) : ')

%Perubahan nilai reaktivitas naik dan turun
A = 0.2; %input('Masukan perubahan reaktivitas (A) : ')

%Lambda kecil
li = [0.0124 0.0305 0.111 0.301 1.1 3.0];

%Fraksi Neutron Kasip
Bi = [0.000215 0.001420 0.001270 0.002570 0.000750 0.000270];
Bli = Bi ./ li;

%Lamda Besar
lamb = 5 * 10^-5;

%Parameter Dinamis
B = sum(Bi);
leff1 = (1/B * sum(Bi ./ li)) ^ -1;
leff2 = 1/B *  sum(Bi .* li);

%Matriks pendekatan lambda
L = ([leff1 leff2]);

x0 = 0.0;           %Waktu awal / Batas awal
t  = 60;            %Waktu akhir
h = (t-x0)/n;       %Lebar segmen

P = 1; %Zero power 1 watt
    
%menentukan jumlah awal prekursor
for i = 1:2
    C(i) = B*P ./ (L(i) * lamb);
endfor

%Syarat Batas Awal  
y0 = [P P C(1) C(2)];

tic;
[x,yr] = Tugas3_RK2(@Tugas3_f2, x0, y0, t, n, h, A, B, lamb, leff1, leff2); %Masuk ke subprogram RK.m
toc;

%plot daya
%subplot(2,1,1);
plot(x,yr(:,1),'m')
legend('Daya Lambda 1');
xlabel('t(s)');
ylabel('P(t)');
xlim([x0 t]); %ylim([0 2.5]);
title('Daya');
figure;

%subplot(2,2,2);
plot(x,yr(:,2),'b')
legend('Daya Lambda 2');
xlabel('t(s)');
ylabel('P(t)');
xlim([x0 t]); %ylim([0 2.5]);
title('Daya');
figure; 

%plot jumlah prekursor
%subplot(2,1,2);
plot(x,yr(:,3),'m')
legend('C lamda 1');
xlabel('t(s)');
ylabel('C(t)');
xlim([x0 t]); %ylim([0 2.5]);
title('Jumlah Prekursor Pendekatan Lamda 1');
figure;

%subplot(2,1,2);
plot(x,yr(:,4),'b')
legend('C lamda 2');
xlabel('t(s)');
ylabel('C(t)');
xlim([x0 t]); %ylim([0 2.5]);
title('Jumlah Prekursor Pendekatan Lamda 2');
figure;