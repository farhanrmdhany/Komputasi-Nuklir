%% Soal #10
    u = rand(1, 5);
    v = rand(1, 5);
function mult = duaVektor(u, v)
    pu = norm(u)
    pv = norm(v)
    if (pu == pv)
        fprintf("Vektor u dan v memiliki panjang yang sama\n")
    else
        fprintf("Vetktor u dan v tidak memiliki panjang yang sama\n")
    end
    sudut = acos(dot(u, v)/(norm(u)*norm(v)))
end