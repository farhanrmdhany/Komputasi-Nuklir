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

%Parameter Dinamis
B = sum(Bi);

%Lamda Besar
lamb = 5 * 10^-5;

x0 = 0.0;           %Waktu awal / Batas awal
t  = 60;            %Waktu akhir
h = (t-x0)/n;       %Lebar segmen

P = 1; %Zero power 1 watt
    
%menentukan jumlah awal prekursor
for i = 1:6
    C(i) = Bi(i)*P / (li(i) * lamb);
endfor

%Syarat Batas Awal  
y0 = [P C(1) C(2) C(3) C(4) C(5) C(6)];          
      
tic;
%Masuk ke subprogram RK.m
[xr,yr] = Tugas3_RK1(@Tugas3_f1, x0, y0, t, n, h, li, Bi, B, lamb,A);  
toc;

%plot daya
subplot(2,1,1);
plot(xr,yr(:,1),'m')
legend('Daya');
xlabel('t(s)');
ylabel('P(t)');
xlim([x0 t]); %ylim([0 2.5]);
title('Daya');

%plot jumlah prekursor
subplot(2,1,2);
plot(xr,yr(:,2),'k', xr,yr(:,3),'r', xr,yr(:,4),'g', xr,yr(:,5),'b', xr,yr(:,6),'c', xr,yr(:,7),'m')
legend('C1','C2','C3','C4','C5','C6');
xlabel('t(s)');
ylabel('C(t)');
xlim([x0 t]); %ylim([0 2.5]);
title('Jumlah Prekursor');
