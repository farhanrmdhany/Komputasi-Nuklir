%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Program Utama;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;clc;clf;

x0 = 0.0;       %Waktu awal / Batas awal
y0 = 20.0;        %Syarat batas awal
n  = input('Masukan jumlah segment (n) : ') %Lebar interval
t  = 100;          %Waktu akhir

tic;
[x,yrk4] = Tugas2_RK(@Tugas2_fb, x0, y0, t, n); %Masuk ke subprogram RK.m
toc;
tic;
[hx, x,yrkh] = Tugas2_RKH(@Tugas2_fb, x0, y0, t, n); %Masuk ke subprogram RKH.m
toc;

ya = 40 * (1 + exp(-0.12 * x))-60 * exp(-0.06 * x); %Menghitung solusi analitik

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
xlim([x0 t]); 
ylim([10 max(ya)]);
title('Perbandingan Metode');

%plot error relatif
subplot(5,1,2);
hold on;
grid on;
plot(x,errRelRK4,'r',x,errRelRKH,'b');
hold off;
legend('ErrRel RK4','ErrRel RKF');
xlabel('Waktu (s)');
ylabel('%');
xlim([x0 t]);
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
xlim([x0 t]);
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
xlim([x0 t]);
title('Galat Sejati RKF');

%plot timestep
subplot(5,1,5);
hold on;
grid on;
plot(x,hx,'g');
hold off;
xlabel('Waktu (s)');
ylabel('h(i)');
xlim([x0 t]); 
%ylim([1e-3 10e-3]);
title('Timestep RKF');