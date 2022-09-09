%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Program Fungsi 1 Grup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fxy = Tugas3_f2(x, y, A, B, lamb, leff1, leff2)

%Prubahan kondisi rho saat waktu tertentu
if (x < 10)
    rho = A*B;
elseif (x >= 20)
    rho = -A*B;
else
    rho = 0;
endif

%Perhitungan daya
fxy(1) = (rho-B)/lamb*y(1) + leff1 * y(3); %dengan pendekatan lambda eff 1
fxy(2) = (rho-B)/lamb*y(2) + leff2 * y(4); %dengan pendekatan lambda eff 2

%Perhitungan jumlah prekursor 1 grup
fxy(3) = (B/lamb)*y(1) - leff1 * y(3); %dengan pendekatan lambda eff 1
fxy(4) = (B/lamb)*y(2) - leff2 * y(4); %dengan pendekatan lambda eff 2


end