function tugas_2 = sub2(Sig_s,Sig_a,thickness,N)
Sig_t=Sig_a+Sig_s; %sigma total
iSig_t=1/Sig_t; 
Pos_coll=zeros(1,N);

jarak=15; %jarak 15 cm sebelum slab
global transmission mencapai serapan scatter_depan scatter_belakang tidak_mencapai total
transmission=0; %langsung melewati/menembus slab
mencapai=0; 
serapan=0;
scatter_depan=0;
scatter_belakang=0;

for i=1:N
    %x = zeros(10000,1);
    %y = zeros(10000,1);
    x(1) = 0; %posisi awal
    y(1) = thickness/2; 
    move_x(1) = 0;
    move_y(1) = 0;
    
    %arah random (360 derajat, asumsi sumber ditengah)
    theta = 360*rand;
    
    alive=1;
    
    %jumlah interaksi neutron %berapa kali ngewhile saat alive=1
    j = 1;
    %parameter plot 
    k = 1;
    
    %tracking neutron
    while(alive)
        if (theta<atand((thickness/2)/jarak)) %mencapai slab
        mencapai = mencapai+1;
        alive=1;
        end 
        
        %get distance to collision, jarak random
        l=-log(1-rand)*iSig_t;     
        
        %move particle
        %x
        move_x(j) = l*cosd(theta);
        %y
        move_y(j) = l*sind(theta);
        
        %posisi skrg
        x(j+1) = x(j) + move_x(j);
        y(j+1) = y(j) + move_y(j);
       
        %still in the slab?
        if (x(j+1)>(jarak+thickness)) %langsung menembus slab
            transmission=transmission+1;
            alive=0;
        elseif (x(j+1)<jarak) %tidak sampai slab
            alive=0;
        elseif (x(j+1)>(jarak+thickness)) %udah masuk slab, terus keluar makin ke kanan
            scatter_belakang=scatter_belakang+1;
            alive=0;
        elseif (x(j+1)<jarak) %udah masuk slab, terus keluar makin ke kiri
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
    %plot vektor atau tracking neutron
    for k = 1:j
    u = x(k); %posisi sebelumnya
    v = y(k);
    hold on;
    quiver (u,v,move_x(k),move_y(k),0,"linewidth",2);
    axis equal;
    grid on;
    k = k+1;
    end
  end

Save the figure
print('coba_scatter1.png','-dpng','-r0')

close all;
end