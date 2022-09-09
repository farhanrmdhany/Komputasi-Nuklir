clear all;clf;clc;

%--------------Import data dari tabel atenuasi massa Pb-------------------------
data = 'Database_Pb.txt';
kolom = importdata(data);

%Keterangan
  %kolom(:,1)= Energi
  %kolom(:,2)= Koef. Atenuasi standar
  %kolom(:,3)= Koef. Atenuasi En

%--------------Parameter komputasi----------------------------------------------
%Densitas Timbal (Pb)
rho = 11.342; %g/cm^3

%Energi foton (MeV)
E1 = 40e-3; 
E2 = 55e-3;

%Menahan emisi sebesar 90%
loss = 0.9;

%Intensitas setelah melewati perisai
thru = 1 - loss;

%--------------Proses Perhitungan Koef. Atenuasi--------------------------------
%Koef atenuasi massa pada foton 40 keV  
  %Mencari baris yang sesuai dengan energi
  k1 = find(kolom(:,1) == E1);
  
  %Menentukan koefisien atenuasi sesuai baris
  Mu(1) = kolom(k1,2);  %Mu standar
  Mu(2) = kolom(k1,3);  %Mu en

%Koef atenuasi massa pada foton 55 keV
  %Interpolasi Linier
  Mu(3) = interp1(kolom(:,1),kolom(:,2),E2,'linear');  %Mu standar
  Mu(4) = interp1(kolom(:,1),kolom(:,3),E2,'linear');  %Mu en
  
  %Interpolasi Cubic Spline
   %Mencari baris antara energi yang akan di interpolasi
    k2 = find(kolom(:,1) <= E2,1,'last');
    k3 = find(kolom(:,1) >= E2,1,'first');
    
    %Menentukan rentang baris kelompok energi yang mencakup 55 keV
    x = [kolom(k2-4:k3+2,1)];
    y1 = [kolom(k2-4:k3+2,2)];
    y2 = [kolom(k2-4:k3+2,3)]; 
    
    %Menghitung koefisien atenuasi dengan spline
    Mu(5) = interp1(x,y1,E2,'spline'); %Mu standar  
    Mu(6) = interp1(x,y2,E2,'spline'); %Mu en

%--------------Proses Perhitungan Ketebalan perisai-----------------------------
for i = 1:length(Mu)
  d(i) = -log(thru)/(Mu(i)*rho);
  d(i)
endfor

%--------------Proses Plotting--------------------------------------------------
%Buat Plot Hubungan Energi vs Koef. Atenuasi Massa
loglog(kolom(:,1),kolom(:,2),'r',kolom(:,1),kolom(:,3),'b--',E1,Mu(1),'o',E1,Mu(2),'*',E2,Mu(3),'^',E2,Mu(4),'v',E2,Mu(5),'s',E2,Mu(6),'d');
legend('Mu Std','Mu en','Mu1 40keV','Mu2 40keV','Lin1 55keV','Lin2 55keV','Sp1 55keV','Sp2 55keV');
title('Koefisien Atenuasi Massa Timbal (Z=82)');
xlabel('Energi Foton (MeV)');
ylabel('Koef. Atenuasi Massa (cm^2/g)');
xlim ([kolom(1,1) kolom(end,1)]);
grid on;
figure;