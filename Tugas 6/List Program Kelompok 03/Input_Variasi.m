%Koding untuk membuat variasi input MCNP
clear all; clf; clc;

%Reaktor Eksperimental
%-----------------------Variasi Pengayaan------------------
enrich = 1:2:50; %pengayaan U235 (1 s.d. 50)%
fraksi = zeros(length(enrich),3); %Definisi matriks pengayaan awal

rho = 10.5;      %densitas massa UO2
NA = 6.022E23;    %bilangan avogadro
MrU235 = 235.0439;%Mr U235
MrU238 = 238.0508;%Mr U238
MrO16 = 15.9949;  %Mr O16

%Massa Molekul UO2 dengan pengayaan
MrUO2 = (enrich./100)*MrU235 + (1-enrich./100)*MrU238 + 2*MrO16;  

%densitas molekul UO2(/b-cm)
NUO2 = rho./MrUO2.*NA.*10E-24;  

%densitas atom O
NO16 = 2.*NUO2;

%densitas atom U
NU = NUO2;
NU235 = (enrich./100).*MrUO2./MrU235.*NUO2;   %U235
NU238 = (1-enrich./100).*MrUO2./MrU238.*NUO2; %U238

%Update Pengayaan
fraksi(:,1) = NU235;
fraksi(:,2) = NU238;
fraksi(:,3) = NO16;

%-----------------------Input Variasi Pengayaan------------
%Buka dan Baca input MCNP
file_MCNP = fopen('Input_MCNP.i','rt');

%Read as a cell array of character vectors
text = textscan(file_MCNP,'%s','delimiter','','endofline',''); 
text = text{1}{1};
fclose(file_MCNP);

for i = 1:length(enrich)
  min = strfind(text,'m1'); %batas atas
  max = strfind(text,'m2'); %batas bawah
    
  %Definisikan baris baru dengan nilai yang baru
  line1 = sprintf('m1    92235.           %.6f  $MAT1\n',fraksi(i,1));
  line2 = sprintf('      92238.           %.6f \n', fraksi(i,2));
  line3 = sprintf('      8016.            %.6f \n', fraksi(i,3));  
  
  %Rewrite
  newtext = [text(1:min-1), line1, line2, line3, text(max:end)];
     
  %Save As
  filename = sprintf('Input_MCNP_%s.i', num2str(enrich(i)))
  dlmwrite(filename, newtext, 'delimiter', '');
endfor
