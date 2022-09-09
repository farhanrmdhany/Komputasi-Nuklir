%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Program Utama;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;clc;clf;

x0 = 0.0;       %Waktu awal / Batas awal
y0 = 1.0;        %Syarat batas awal
n  = input('Masukan jumlah segment (n) : ') %Lebar interval
t  = 3;          %Waktu akhir

tic;
[x,yrk4] = Tugas2_RK(@Tugas2_fa, x0, y0, t, n); %Masuk ke subprogram RK.m
toc;
tic;
[hx, x, yrkh] = Tugas2_RKH(@Tugas2_fa, x0, y0, t, n); %Masuk ke subprogram RKH.m
toc;

ya = -exp(-1000 * x) + x +2; %Menghitung solusi analitik

%Menentukan error relative tiap metode
errSejRK4 = (ya - yrk4);
errSejRKH = (ya - yrkh);
errRelRK4 = abs((ya-yrk4)./ya)*100;
errRelRKH = abs((ya-yrkh)./ya)*100;

%plot perbandingan analitik dan numerik
subplot(5,1,1);
hold on;
grid on;
plot(x,yrk4,'r--',x,yrkh,'b--',x,ya,'k')
hold off;
legend('RK Orde 4','RK-Felhberg','Analitik');
xlabel('Waktu (s)');
ylabel('Y(t)');
xlim([x0 0.05]); 
ylim([0 3]);
title('Perbandingan Metode');

%plot error relatif
subplot(5,1,2);
hold on;
grid on;
plot(x,errRelRK4,'r', x, errRelRKH,'b');
hold off;
legend('ErrRel RK4','ErrRel RKF');
xlabel('Waktu (s)');
ylabel('%');
xlim([x0 0.05]);
ylim([0 100]);
title('Galat Relatif');

%plot error sejati RK4
subplot(5,1,3);
hold on;
grid on;
plot(x,errSejRK4,'r');
hold off;
legend('ErrSej RK4');
xlabel('Waktu (s)');
ylabel('-');
xlim([x0 0.05]);
title('Galat Sejati RK4');

%plot error sejati RKF
subplot(5,1,4);
hold on;
grid on;
plot(x,errSejRKH,'b');
hold off;
legend('ErrSej RKF');
xlabel('Waktu (s)');
ylabel('-');
xlim([x0 0.05]);
title('Galat Sejati RKF');

%plot timestep
subplot(5,1,5);
hold on;
grid on;
plot(x,hx,'g');
hold off;
xlabel('Waktu (s)');
ylabel('h(i)');
xlim([x0 0.05]); 
%ylim([1e-3 10e-3]);
title('Timestep RKF');