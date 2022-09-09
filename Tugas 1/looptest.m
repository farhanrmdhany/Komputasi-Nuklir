%% Soal #9
function kalang = looptest(N)
    for i = 1:N
        mod2 = mod (i,2);
        mod3 = mod (i,3);
        if (mod2 == 0 && mod3 == 0)
            fprintf ("%0.0f dapat dibagi dengan 2 DAN 3\n", i)
        elseif  (mod2 == 0 && mod3 != 0)
            fprintf ("%0.0f dapat dibagi dengan 2\n", i)
        elseif  (mod2 != 0 && mod3 == 0)
            fprintf ("%0.0f dapat dibagi dengan 3\n", i)
        else
            fprintf ("%0.0f TIDAK DAPAT dibagi dengan 2 atau 3\n", i)
        end
    end
end
