%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Program Runge Kutta Orde 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [T,Y] = Tugas2_RK(f, x0, y0, t, n)

%fungsi Runge Kutta orde 4
%penyelesaian numerik persamaan diferensial dengan metode Runge Kutta orde 4

h = (t-x0)/n; %Banyak segmen
Y = zeros(n+1, 1); % variabel terikat awal
T = zeros(n+1, 1); % variabel waktu awal

%syarat awal
T(1) = x0;
Y(1) = y0;

%jalankan sebanyak n langkah
for i = 1:n
    k1 = h*f(T(i), Y(i));
    k2 = h*f(T(i) + 1/2*h, Y(i) + 1/2*k1);
    k3 = h*f(T(i) + 1/2*h, Y(i) + 1/2*k2);
    k4 = h*f(T(i) + h, Y(i) + k3);
    Y(i+1) = Y(i) + 1/6*(k1 + 2*k2 + 2*k3 + k4); %Menentukan Y pada segmen berikutnya
    T(i+1) = T(i) + h; %Menentukan T pada segmen berikutnya
endfor
end