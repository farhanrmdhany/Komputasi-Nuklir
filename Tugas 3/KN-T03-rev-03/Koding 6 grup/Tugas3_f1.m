%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Program Fungsi 6 Grup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fxy = Tugas3_f1(x,y,li,Bi,B,lamb,A)

    if x<=10
        rho = A*B;
    elseif x>=20
        rho = -A*B;
    else
        rho = 0;
    endif

    %Perhitungan daya
    fxy(1) = (rho-B)/lamb*y(1) + li(1) * y(2) + li (2) * y(3) + li(3) * y(4) + li(4) * y(5) + li(5) * y(6) + li(6) * y(7);
    
    %Perhitungan jumlah prekursor 6 grup
    fxy(2) = (Bi(1)/lamb)*y(1) - li(1) * y(2);
    fxy(3) = (Bi(2)/lamb)*y(1) - li(2) * y(3);
    fxy(4) = (Bi(3)/lamb)*y(1) - li(3) * y(4);
    fxy(5) = (Bi(4)/lamb)*y(1) - li(4) * y(5);
    fxy(6) = (Bi(5)/lamb)*y(1) - li(5) * y(6);
    fxy(7) = (Bi(6)/lamb)*y(1) - li(6) * y(7);
end