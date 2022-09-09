function tugasakhir = coba_plot1(Sig_s,Sig_a,thickness,N)
tugasakhir=0;
Sig_t=Sig_a+Sig_s; %sigma total
iSig_t=1/Sig_t; 
Pos_collx=zeros(1,N);
Pos_colly=zeros(1,N);
jarak=15; %jarak 15 cm sebelum slab

global transmission mencapai serapan scatter_depan scatter_belakang tidak_mencapai total
transmission=0; %langsung melewati/menembus slab
mencapai=0;
serapan=0;
scatter_depan=0;
scatter_belakang=0;
tidak_mencapai=0;

for i=1:N
    
%   x = zeros(10000,1);
%   y = zeros(10000,1);
    x = 0; %posisi awal
    y = thickness/2; 
    move_x = 0;
    move_y = 0;
    
    %arah random (360 derajat, asumsi sumber ditengah)
    theta = 360*rand;
    
    alive=1;
    
    %jumlah interaksi neutron %berapa kali ngewhile saat alive=1
    j = 1;

    if ((theta<atand((thickness/2)/jarak)) || (theta>(360-atand((thickness/2)/jarak)))) %mengarah slab
    mencapai = mencapai+1;
    alive=1;
    else
        tidak_mencapai = tidak_mencapai + 1;
    alive=0;
    end
  
    %tracking neutron
    while(alive)
        %get distance to collision, jarak random
        l=-log(1-rand)*iSig_t;     
        
        %move particle
        %x
        move_x = l*cosd(theta);
        %y
        move_y = l*sind(theta);
        
        %posisi skrg
        x = x + move_x;
        y = y + move_y;
       
      
        %still in the slab?
        if (j==1) && (x>(jarak+thickness)) && (theta<atand((thickness/2)/jarak)) %menembus slab
            transmission=transmission+1;
            alive=0;
        elseif (j==1) && (x<jarak) && (theta<atand((thickness/2)/jarak)) %tidak sampai slab
            tidak_mencapai = tidak_mencapai+1;
            alive=0;
        elseif (j>1)&&(x>(jarak+thickness)) %udah masuk slab, terus keluar makin ke kanan
            scatter_belakang=scatter_belakang+1;
            alive=0;
        elseif (j>1)&&(x<jarak) %udah masuk slab, terus keluar makin ke kiri
            scatter_depan=scatter_depan+1;
            alive=0;

          
        else %scatter or absorb
            if (rand<Sig_s*iSig_t)
                %scatter, pick new theta (arah terhambur yang baru)
                theta=360*rand;
                j = j+1;
            else %absorb
                serapan=serapan+1;
                alive=0;
            end
        end
        
    end
    
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
colormap('spring')

end