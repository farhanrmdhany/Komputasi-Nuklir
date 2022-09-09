%Koding ekstrak output MCNP dan plot hasil
clear all; clf; clc;

%-----------------------Panggil Hasil-----------------------
%Penomoran Pengayaan
enrich = 1:2:50;
for i = 1:length(enrich)
  files{i} = sprintf('Output_MCNP_%s.o', num2str(enrich(i)));
end

%Inisialisasi cell mydata
mydata=cell(numel(files),2);

%-----------------------Ekstrak Keff-----------------------
for i=1:numel(files)
  %Definisikan path file output
  myFile=fullfile(files{i});
  %Buka file output
  oneFile=fopen(myFile,'rt');
  %Salin teks file output
  text=textscan(oneFile,'%s','delimiter','','endofline','');
  text=text{1}{1};
  %Tutup file output
  oneFile=fclose(oneFile);

  %Cari posisi kata kunci
  target=strfind(text, 'final result');
  
  %Ambil nilai keff
  x = str2double(text(target + 17 : target+24));
  
  %Masukkan nilai keff dalam cell mydata
  mydata{i,1}=enrich(i);
  mydata{i,2}=x;
end

%-----------------------Plotting---------------------------
%Ubah cell menjadi matriks untuk plotting
keff = cell2mat(mydata);
plot(keff(:,1),keff(:,2),'r-o');
grid on;
xlabel('U-235 % Enrichment');
ylabel('K-eff');
title('Perbandingan Tingkat Enrichment terhadap Nilai K-eff');
xlim([enrich(1) enrich(end)]);
figure;
