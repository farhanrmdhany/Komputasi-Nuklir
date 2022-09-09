clear; clc; clf;
%-----------------------Parameter Teras-------------------------------------   
    %Densitas Atom Bahan Bakar (atom/cm^3)
    N = [2.75 2.76 0.369 0.171 0.0191 0.659 0.01] * 1e22;
    
    %Tampang lintang fisil x nu
    nusigMicroFiss = [0 0 0 0 758 1.82 0] * 1e-24;    %(cm^2)
    
        %TL total fisil
        nusigMacroFiss = sum(N .* nusigMicroFiss); 
    
    %Tampang lintang absorbsi
    sigMicroAbs = [0.29 0.0002 0.19 2.33 484 2.11 3410] * 1e-24; %(cm^2)
    
        %TL total absorbsi
        sigMacroAbs = sum(N .* sigMicroAbs); 
    
    %Tampang lintang transport
    sigMicroTrans = [0.65 0.26 0.79 0.55 1.62 1.02 0.89] * 1e-24; %(cm^2)
        
        %TL total transport
        sigMacroTrans = sum(N .* sigMicroTrans); 
    
    %Konstanta Difusi Teras
    Dter = 1 / (3 * sigMacroTrans); 
    
    %Flux eksternal (n/cm^3/s)
    S = 1e4;

%-----------------------Parameter Reflektor---------------------------------   
    %Konstanta Difusi Reflektor
    Dref = 1; %satuan cm

    %Tampang lintang absorbsi reflektor
    sigAref = 0.1; %satuan /cm
    
    %Ketebalan reflektor
    x_r(2,:) = [5 10 20];   %satuan cm   
        
%-----------------------Parameter Komputasi---------------------------------   
    %Banyak Titik Diskritisasi
    %Untuk kasus 2 nanti diskritisasi menjadi 2*n karena sebesar n untuk teras
    %sebesar n untuk reflektor
    n = 100;
    
    %Batas Teras Papan
    xmin = 0;               %Pusat teras
    xedge = 50;             %Ujung kanan teras tanpa reflektor
    xmax = xedge .+ x_r;    %Ujung kanan teras + reflektor
    
%-----------------------Proses Iterasi--------------------------------------
%-----------------------kasus 1 = tanpa reflektor---------------------------
    tic;
    %Variabel untuk plotting
    yPlot1 = zeros(length(x_r),n);
    
    %Jarak antar titik diskritisasi teras
    h(1) = (xedge - xmin) / (n - 1);
        
    %Nilai X disetiap titik diskritisasi teras
    x(1,:) = xmin:h(1):xedge;
    
    %Inisialisasi persebaran flux neutron di BB
    yOld1 = ones(1, n)*S;
    yNew1 = yOld1;
    
    %inisialisasi norm
    R2 = 1;
            
    while R2 > 1e-6        
        %Konstanta diskritisasi teras
        aW(1) = 1/h(1)^2;
        a0(1) = (nusigMacroFiss - sigMacroAbs) / Dter - 2/h(1)^2;
        aE(1) = 1/h(1)^2;
        B(1) = -S/Dter;
            
        %Syarat Batas di x = 0 cm
        residu(1) = -3/(2*h(1))*yOld1(1) + 4/(2*h(1))*yOld1(2) - 1/(2*h(1))*yOld1(3);
        yNew1(1) = (4*yOld1(2) - yOld1(3))/3;
                  
        %Syarat Batas di x = xedge dengan metode Robin
        residu(end) = Dter/(4*h(1))*yOld1(end-2)-Dter/h(1)*yOld1(end-1)+(1/4+3*Dter/(4*h(1)))*yOld1(end);
        yNew1(end) = Dter*(4*yOld1(end-1)-yOld1(end-2))/(h(1)+3*Dter); 
                
        %Iterasi untuk mencari solusi dari matrix tridiagonal
        %Dimulai dari baris ke 2 sampai n-1
        for i = 2:(n-1)
            residu(i) = B(1) - aW(1) * yNew1(i-1) - a0(1) * yOld1(i) - aE(1) * yOld1(i+1);
            yNew1(i) = yOld1(i) + residu(i)/a0(1);
        endfor
            
        %Perhitungan norm berikutnya
        R2 = sqrt(sum(residu .^ 2))
        
        %Update Nilai    
        yOld1 = yNew1;
    endwhile
            
    %Update nilai untuk plotting    
    yPlot1 = yNew1;
        
    %Membersihkan perhitungan
    residu(1,:) = [];
    R2 = [];
    h(1) = [];          
    toc;
        
%-----------------------kasus 2 = dengan reflektor--------------------------
  %Untuk plotting sumbu y
  yPlot2 = zeros(length(x_r),2*n);
  
  %Iterasi untuk variasi ketebalan reflektor
for tebal = 1 : length(x_r)
    
  %Interval diskritisasi teras
  h(1) = (xedge-xmin)/(n-1);
  
  %Posisi diskritisasi teras
  xa(1,:) = xmin:h(1):xedge;
  
  %Interval diskritisasi reflektor
  h(2) = x_r(2,tebal)/(n-1);
  
  %Posisi diskritisasi reflektor
  xa(2,:) = xedge:h(2):xmax(2,tebal);
   
  %Untuk Plotting posisi di teras
  xPlot2(1:n) = xa(1,:);
  
  %Untuk plotting posisi di reflektor
  xPlot2(n+1:n*2) = xa(2,:);

  %Inisiasi kondisi awal
  yOld2 = ones(tebal,n*2)*S;
  yNew2 = yOld2;
  
  %Inisiasi norm
  R2 = 1;
  
  while R2 > 1e-6          
    %Konstanta diskritisasi teras
    aW(1) = 1/h(1)^2;
    a0(1) = (nusigMacroFiss - sigMacroAbs) / Dter - 2/h(1)^2;
    aE(1) = 1/h(1)^2;
    B(1) = -S/Dter;
                
    %Konstanta diskritisasi reflektor
    aW(2) = 1/h(2)^2;
    a0(2) = -sigAref/Dref - 2/h(2)^2;
    aE(2) = 1/h(2)^2;
    B(2) = 0;
    
    %Pada titik tengah x=xmin=0, flux maksimum, dengan metode neuman
    residu(tebal,1) = -3/(2*h(1))*yOld2(tebal,1) + 4/(2*h(1))*yOld2(tebal,2) - 1/(2*h(1))*yOld2(tebal,3);
    
    yNew2(tebal,1) = (4*yOld2(tebal,2) - yOld2(tebal,3))/3;
    
    %Pada batas x=xedge=50, berlaku kontinuitas arus dan flux neutron
    residu(tebal,n) = Dref*(-yOld2(tebal,n+3)+4*yOld2(tebal,n+2)-3*yOld2(tebal,n+1))/h(2) - (Dter*(3*yOld2(tebal,n)-4*yOld2(tebal,n-1)+yOld2(n-2))/h(1));
    
    yNew2(tebal,n) = (h(1)*Dref)/(3*Dter*h(1))*(-yOld2(tebal,n+3)+4*yOld2(tebal,n+2)-3*yOld2(tebal,n+1)) + 4/3*yOld2(tebal,n-1) - 1/3*yOld2(tebal,n-2);
    
    %Pada batas x=xmax=ujunbg reflektor, flux adalah min, dengan metode robin
    residu(tebal,end) = Dref/(4*h(2))*yOld2(tebal,end-2)-Dref/h(2)*yOld2(tebal,end-1)+(1/4+3*Dref/(4*h(2)))*yOld2(tebal,end);
          
    yNew2(tebal,end) = Dref*(4*yOld2(tebal,end-1)-yOld2(tebal,end-2))/(h(2)+3*Dref);   
    
    %Iterasi dari titik i = 2 samapai 2*n-1
    for i = 2:(2*n)-1
      if i<=n %posisi di teras
        residu(tebal,i)=B(1)-aW(1)*yNew2(tebal,i-1)-a0(1)*yOld2(tebal,i)-aE(1)*yOld2(tebal,i+1);
        yNew2(tebal,i)=yOld2(tebal,i)+residu(tebal,i)/a0(1);       
      elseif i==n
        continue;
      else %Posisi akhir teras, awal reflektor
        residu(tebal,i)=B(2)-aW(2)*yNew2(tebal,i-1)-a0(2)*yOld2(tebal,i)-aE(2)*yOld2(tebal,i+1);                  
        yNew2(tebal,i)=yOld2(tebal,i)+residu(tebal,i)/a0(2);  
      endif
    endfor
    
    %Melihat konvergensi
    R2 = sqrt(sum(residu(tebal,:).^2))
    
    %Perbarui nilai yOld2
    yOld2(tebal,:) = yNew2(tebal,:);
  endwhile
  
  %Update plotting
  yPlot2(tebal,:) = yNew2(tebal,:);
endfor
  
%-----------------------Proses Plotting-------------------------------------
%Plot kasus 1
plot(x,yPlot1(1,:),'r')
xlabel('Posisi (cm)');
ylabel('Flux(x) (n/cm^2/s)');
xlim([xmin xedge]);
title('Kasus 1');
figure;

%Plot kasus 1 skala semi-log
semilogy(x,yPlot1(1,:),'r')
xlabel('Posisi (cm)');
ylabel('Flux(x) (n/cm^2/s)');
xlim([xmin xedge]);
ylim([yPlot(1,1) yPlot(1,end)]);
title('Kasus 1 - Semilog');
figure;

%Plot kasus 2
plot(x,yPlot1(1,:),'r',xPlot2,yPlot2(1,:),'b',xPlot2,yPlot2(2,:),'g',xPlot2,yPlot2(3,:),'k');
hold on
legend('0 cm','5 cm','10 cm','20 cm');
xlabel('Posisi (cm)');
ylabel('Flux(x) (n/cm^2/s)');
xlim([xmin xmax(2,3)]);
title('Kasus 2');
figure;
   
%Plot kasus 2 skala semi-log
semilogy(x,yPlot1(1,:),'r',xPlot2,yPlot2(1,:),'b',xPlot2,yPlot2(2,:),'g',xPlot2,yPlot2(3,:),'k');
legend('0 cm','5 cm','10 cm','20 cm');
xlabel('Posisi (cm)');
ylabel('Flux(x) (n/cm^2/s)');
xlim([xmin xmax(2,3)]);
title('Kasus 2 - Semilog');
figure;