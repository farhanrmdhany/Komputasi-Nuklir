%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Program Runge Kutta Orde 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [T,Y] = Tugas3_RK2(f, x0, y0, t, n, h, A, B, lamb, leff1, leff2)

%fungsi Runge Kutta orde 5
%penyelesaian numerik persamaan diferensial dengan metode Runge Kutta orde 5

Y = zeros(n+1, length(y0));  % variabel terikat awal
T = zeros(n+1, 1);  % variabel waktu awal

%syarat awal
T(1) = x0;
Y(1,:) = y0;

%jalankan sebanyak n langkah
for i = 1:n
    k1 = h*f(T(i), Y(i,:), A, B, lamb, leff1, leff2);
    k2 = h*f(T(i) + 1/4*h, Y(i,:) + 1/4*k1, A, B, lamb, leff1, leff2);
    k3 = h*f(T(i) + 1/4*h, Y(i,:) + 1/8*k1 + 1/8*k2, A, B, lamb, leff1, leff2);
    k4 = h*f(T(i) + 1/2*h, Y(i,:) - 1/2*k2 + k3, A, B, lamb, leff1, leff2);
    k5 = h*f(T(i) + 3/4*h, Y(i,:) + 3/16*k1 + 9/16*k4, A, B, lamb, leff1, leff2);
    k6 = h*f(T(i) + h, Y(i,:) - 3/7*k1 + 2/7*k2 + 12/7*k3 - 12/7*k4 + 8/7*k5, A, B, lamb, leff1, leff2);
    %Menentukan Y pada segmen berikutnya
    Y(i+1,:) = Y(i,:) + 1/90 * (7*k1 + 32*k3 + 12*k4 + 32*k5 + 7*k6);
    
    %Menentukan T pada segmen berikutnya
    T(i+1) = T(i) + h;
    
endfor
end