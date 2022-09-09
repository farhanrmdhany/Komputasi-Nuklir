%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Program Runge Kutta Fehlberg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ht, T,Y] = Tugas2_RKH(f, x0, y0, t, n)

% Fungsi Runge-Kutta penyelesaian numerik persamaan diferensial dengan metode
% Runge-Kutta Adaptive

h = (t-x0)/n;       %Menentukan banyak segment
ht(1, :) = h;       %Perubahan adaptif interval tiap segmen
Y = zeros(n+1, 1);  %Variabel terikat awal
T = zeros(n+1, 1);  %Variabel bebas awal

% syarat awal
T(1) = x0;
Y(1) = Y4(1) = Y5(1) = y0; 

%Input parameter adaptive
tol  = input('Inputkan Batas Toleransi (T): ');
S    = input('Inputkan Nilai Safety (S)   : ' ); 
N    = input('Inputkan Nilai Ekspansi (N) : ' );

%Parameter untuk iterasi adaptif
i = 1;

% jalankan sebanyak n langkah
while i<=n
    k1 = h(i) * f(T(i), Y(i));
    k2 = h(i) * f(T(i) + h(i)/4, Y(i) + k1/4);
    k3 = h(i) * f((T(i) + 3/8 * h(i)), (Y(i)+3/32* k1 + 9/32 * k2));
    k4 = h(i) * f((T(i) + 12/13 * h(i)),(Y(i) + 1932/2197 * k1 - 7200/2197 * k2 + 7296/2197 * k3));
    k5 = h(i) * f((T(i) + h(i)), (Y(i) + 439/216 * k1 - 8 * k2 + 3680/513 * k3 - 845/4104 * k4));
    k6 = h(i) * f((T(i) + 1/2 * h(i)), (Y(i) - 8/27 * k1 + 2 * k2 - 3544/2565 * k3 + 1859/4104 * k4 - 11/40 * k5));
                
    %Menghitung variabel terikat dan variabel bebas pada kondisi berikutnya    
    %Y orde 4
    Y4(i+1) = Y(i) + (25./216 .* k1 + 1408./2565 .* k3 + 2197./4104 .* k4 - 1./5 .* k5);
    
    %Y orde 5
    Y5(i+1) = Y(i) + 16./135 .* k1 + 6656./12825 .* k3 + 28561./56430 .* k4 - 9./50 .* k5 + 2./55 .* k6;
    T(i+1) = T(i) + h(i);
            
    %Menghitung perkiraan error untuk menentukan lebar interval   
    err = 1/h(i) * abs( Y5(i+1) - Y4(i+1)); 

    if (err <= tol) %Diterima, dan gunakan interval berikut untuk langkah berikutnya
        Y(i+1) = Y5(i+1);
	    if (err/tol > (N/S)^-5)
            h(i+1) = S*h(i)*abs(tol/err)^0.2;
        else 
            h(i+1) = N*h(i);
        endif
        i = i + 1;
    else 
	   	h(i) = S*h(i)*abs(tol/err)^0.25; %Ditolak, dan gunakan interval berikut untuk menghitung solusi sekarang
	endif
endwhile
end
