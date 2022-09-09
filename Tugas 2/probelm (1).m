%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Program Utama;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;clc;clf;

x0 = 0.0;               %Waktu awal / Batas awal
y0 = [1.0 1.0];          %Syarat batas awal
n  = input('Masukan jumlah segment (n) : ') %Lebar interval
t  = 1;          %Waktu akhir

tic;
[x,yr] = RK(@fa, x0, y0, t, n); %Masuk ke subprogram RK.m
toc;

%Menghitung solusi analitik
ya1 = -exp(x) + 2*x +2; 
ya2 = exp(x) - 2*x;

%Menentukan error relative tiap metode
%errSejati1 = ya1-yr(:,1);
%errSejati2 = ya1-yr(:,2);
errRelRK41 = abs((ya1-yr(:,1))./ya1)*100;
errRelRK42 = abs((ya2-yr(:,2))./ya2)*100;

%plot perbandingan analitik dan numerik 1
subplot(2,2,1);
plot(x,yr(:,1),'b--',x,ya1,'k')
legend('RK Orde 4','Analitik');
xlabel('Waktu (s)');
ylabel('Y(t)');
xlim([x0 t]); %ylim([0 2.5]);
title('Perbandingan metode RK Orde 4 dan Analitik');
fprintf('\n\n');

%plot error
subplot(2,2,3);
plot(x, errRelRK41,'b');
legend('Error Relative');
xlabel('Waktu (s)');
ylabel("%");
xlim([x0 t]);
title('Galat relatif metode RK Orde 4');

%plot perbandingan analitik dan numerik 2
subplot(2,2,2);
plot(x,yr(:,2),'b--',x,ya2,'k')
legend('RK Orde 4','Analitik');
xlabel('Waktu (s)');
ylabel('Y(t)');
xlim([x0 t]); %ylim([0 2.5]);
title('Perbandingan metode RK Orde 4 dan Analitik');
fprintf('\n\n');

%plot error
subplot(2,2,4);
plot(x,errRelRK42,'m');
legend('Error Relative');
xlabel('Waktu (s)');
ylabel("%");
xlim([x0 t]);
title('Galat relatif metode RK Orde 4');