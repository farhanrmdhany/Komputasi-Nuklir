clear all; clc; clf;
global transmission mencapai serapan scatter_depan scatter_belakang tidak_mencapai total 

N=1E6;
Sig_s=(0.01+0.02+0.01)/3;
Sig_a=(0.03+0.05+0.01)/3;
thickness=100; 

tugas_1 = sub1(Sig_s,Sig_a,thickness,N);
%tugas_2 = sub2(Sig_s,Sig_a,thickness,N);

%Menampilkan nilai
transmission      %menembus slab
mencapai          %Masuk ke slab
serapan           %terserap slab
scatter_depan     %Terhambur ke kanan
scatter_belakang  %Terhambur ke kiri
tidak_mencapai    %Tidak memasuki slab
total             %Total neutron