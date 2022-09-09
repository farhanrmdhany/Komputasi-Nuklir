function tugas_1 = sub1(Sig_s,Sig_a,thickness,N)

Sig_t=Sig_a+Sig_s;
iSig_t=1/Sig_t; 

%Inisiasi posisi
Pos_collx=zeros(1,N);
Pos_colly=zeros(1,N);

%Posisi sumber dari slab
jarak=15;

global transmission mencapai serapan scatter_depan scatter_belakang tidak_mencapai total

%Inisiasi kondisi
transmission=0; %langsung melewati/menembus slab
mencapai=0;
serapan=0;
scatter_depan=0;
scatter_belakang=0;
tidak_mencapai=0;

for i=1:N
    %konsidi awal
    x = 0;
    y = thickness/2;
    
    %jarak bebas neutron awal
    move_x = 0;
    move_y = 0;
    
    %sudut neutron
    theta = 360*rand;
    
    %Status neutron
    alive=1;
    
    if ((theta<atand((thickness/2)/jarak)) || (theta>(360-atand((thickness/2)/jarak)))) %mengarah slab
    mencapai = mencapai+1;
    alive=1;
    else
        tidak_mencapai = tidak_mencapai + 1;
    alive=0;
    end

    %Parameter iterasi
    j = 1;
    while(alive)
        %get distance to collision, jarak random
        l=-log(1-rand)*iSig_t;     
        %move particle
        move_x = l*cosd(theta);
        move_y = l*sind(theta);
        %update posisi
        x = x + move_x;
        y = y + move_y;

        %menembus slab
        if (j==1) && (x>(jarak+thickness)) && (theta<atand((thickness/2)/jarak)) 
            transmission=transmission+1;
            alive=0;
        %tidak menembus slab
        elseif (j==1) && (x<jarak) && (theta<atand((thickness/2)/jarak)) 
            tidak_mencapai = tidak_mencapai+1;
            alive=0;
        %Terhambur ke kiri
        elseif (j>1)&&(x>(jarak+thickness)) 
            scatter_belakang=scatter_belakang+1;
            alive=0;
        %terhambur ke kanan
        elseif (j>1)&&(x<jarak) 
            scatter_depan=scatter_depan+1;
            alive=0;

        else %menentukan interaksi hamburan atau serapan
            if (rand<Sig_s*iSig_t)
                theta=360*rand;
                j = j+1;
            else %absorb
                serapan=serapan+1;
                alive=0;
            end
        end
        
    end
    
    %update posisi hamburan
    Pos_collx(i)=x;
    Pos_colly(i)=y;
  end

total = transmission+scatter_depan+scatter_belakang+serapan+tidak_mencapai;
%batas sumbu
sx = [15:115];
sy = [0:100];
hitung = zeros(100,100);

%hitung interaksi
for i=1:N
  for ty=100:-1:1
    if(Pos_colly(i)>=sy(ty))&&(Pos_colly(i)<sy(ty+1)) %tepi kiri dan tepi kanan region 1x1
    for tx=1:100
      if(Pos_collx(i)>=sx(tx))&&(Pos_collx(i)<sx(tx+1))
      hitung(tx,ty)=hitung(tx,ty)+1;
      end
    end
    end
  end
end

pltx = 1:1:100;
plty = 1:1:100;
imagesc(sx,sy,hitung');
set(gca,'YDir','normal');
grid on 
grid minor
colorbar

end