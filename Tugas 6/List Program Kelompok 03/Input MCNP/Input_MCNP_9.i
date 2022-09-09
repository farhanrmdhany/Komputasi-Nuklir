c Cell Card                                                                     
c fuel pin                                                                       
    1     1   -10.5 -1 
    2     1   -10.5 -2 
    3     1   -10.5 -3 
    4     1   -10.5 -4 
    5     1   -10.5 -5 
    6     1   -10.5 -6 
    7     1   -10.5 -7 
    8     1   -10.5 -8 
    9     1   -10.5 -9 
   10     1   -10.5 -10 
   11     1   -10.5 -11 
   12     1   -10.5 -12 
   13     1   -10.5 -13 
   14     1   -10.5 -14 
   15     1   -10.5 -15 
   16     1   -10.5 -16 
c gas
   17     2  -0.001 51 -52 1 -17 
   18     2  -0.001 51 -52 2 -18 
   19     2  -0.001 51 -52 3 -19 
   20     2  -0.001 51 -52 4 -20 
   21     2  -0.001 51 -52 5 -21 
   22     2  -0.001 51 -52 6 -22 
   23     2  -0.001 51 -52 7 -23 
   24     2  -0.001 51 -52 8 -24 
   25     2  -0.001 51 -52 9 -25 
   26     2  -0.001 51 -52 10 -26 
   27     2  -0.001 51 -52 11 -27 
   28     2  -0.001 51 -52 12 -28 
   29     2  -0.001 51 -52 13 -29 
   30     2  -0.001 51 -52 14 -30 
   31     2  -0.001 51 -52 15 -31 
   32     2  -0.001 51 -52 16 -32 
c cladding                                                                      
   33     3      -8 53 -54 #17 #1 -33 
   34     3      -8 53 -54 #18 #2 -34 
   35     3      -8 53 -54 #19 #3 -35 
   36     3      -8 53 -54 #20 #4 -36 
   37     3      -8 53 -54 #21 #5 -37 
   38     3      -8 53 -54 #22 #6 -38 
   39     3      -8 53 -54 #23 #7 -39 
   40     3      -8 53 -54 #24 #8 -40 
   41     3      -8 53 -54 #25 #9 -41 
   42     3      -8 53 -54 #26 #10 -42 
   43     3      -8 53 -54 #27 #11 -43 
   44     3      -8 53 -54 #28 #12 -44 
   45     3      -8 53 -54 #29 #13 -45 
   46     3      -8 53 -54 #30 #14 -46 
   47     3      -8 53 -54 #31 #15 -47 
   48     3      -8 53 -54 #32 #16 -48 
c teras                                                                         
   49     2  -0.001 53 -54 -55 56 -57 58 33 34 35 36 37 38 39 40 41 42 43 44 45
             46 47 48
   50     4    -1.7 (-55 56 -57 58 )(54 -61 ) $reflektor_c atas
   51     4    -1.7 (-55 56 -57 58 )(-53 62 ) $reflektor_c bawah
   52     4    -1.7 -63 #49 #50 #51 17 18 19 20 21 22 23 24 25 26 $reflektor_C
             27 28 29 30 31 32 #33 #34 #35 #36 #37 #38 #39 #40 #41 #42 #42 #43
             #44 #45 #46 #47 #48
   53     5    -7.8 63 -64  $selubung_Fe
   54     6  -0.005 -99 64 
   55     0         99 

c Surface Card
c Bahan Bakar
    1       rcc 0 0 -29.7 0 0 59.4 3.35  $fuel1
    2       rcc 10 0 -29.7 0 0 59.4 3.35  $fuel2
    3       rcc 20 0 -29.7 0 0 59.4 3.35  $fuel3
    4       rcc 30 0 -29.7 0 0 59.4 3.35  $fuel4
    5       rcc 0 10 -29.7 0 0 59.4 3.35  $fuel5
    6       rcc 10 10 -29.7 0 0 59.4 3.35  $fuel6
    7       rcc 20 10 -29.7 0 0 59.4 3.35  $fuel7
    8       rcc 30 10 -29.7 0 0 59.4 3.35  $fuel8
    9       rcc 0 20 -29.7 0 0 59.4 3.35  $fuel9
   10       rcc 10 20 -29.7 0 0 59.4 3.35  $fuel10
   11       rcc 20 20 -29.7 0 0 59.4 3.35  $fuel11
   12       rcc 30 20 -29.7 0 0 59.4 3.35  $fuel12
   13       rcc 0 30 -29.7 0 0 59.4 3.35  $fuel13
   14       rcc 10 30 -29.7 0 0 59.4 3.35  $fuel14
   15       rcc 20 30 -29.7 0 0 59.4 3.35  $fuel15
   16       rcc 30 30 -29.7 0 0 59.4 3.35  $fuel16
c gas                                                                           
   17       c/z 0 0 3.4  $He1
   18       c/z 10 0 3.4  $He2
   19       c/z 20 0 3.4  $He3
   20       c/z 30 0 3.4  $He4
   21       c/z 0 10 3.4  $He5
   22       c/z 10 10 3.4  $He6
   23       c/z 20 10 3.4  $He7
   24       c/z 30 10 3.4  $He8
   25       c/z 0 20 3.4  $He9
   26       c/z 10 20 3.4  $He10
   27       c/z 20 20 3.4  $He11
   28       c/z 30 20 3.4  $He12
   29       c/z 0 30 3.4  $He13
   30       c/z 10 30 3.4  $He14
   31       c/z 20 30 3.4  $He15
   32       c/z 30 30 3.4  $He16
c cladding                                                                      
   33       c/z 0 0 3.5 
   34       c/z 10 0 3.5 
   35       c/z 20 0 3.5 
   36       c/z 30 0 3.5 
   37       c/z 0 10 3.5 
   38       c/z 10 10 3.5 
   39       c/z 20 10 3.5 
   40       c/z 30 10 3.5 
   41       c/z 0 20 3.5 
   42       c/z 10 20 3.5 
   43       c/z 20 20 3.5 
   44       c/z 30 20 3.5 
   45       c/z 0 30 3.5 
   46       c/z 10 30 3.5 
   47       c/z 20 30 3.5 
   48       c/z 30 30 3.5 
   49        pz -29.7  $bawah_fuel
   50        pz 29.7  $atas_fuel
   51        pz -29.9  $bawah_gas
   52        pz 29.9  $atas_gas
   53        pz -30  $bawah_teras
   54        pz 30  $atas_teras
   55        px 34.9999  $dimensi teras x
   56        px -4.9999  $dimensi teras x
   57        py 34.9999  $dimensi teras y
   58        py -4.9999  $dimensi teras y
   61        pz 50  $ batas reflektor
   62        pz -50 
   63       rcc 15 15 -50 0 0 100 40 
   64       rcc 15 15 -50 0 0 100 42  $ dimensi penyelimut reflektor Fe
   99       rcc 15 15 -70 0 0 140 62  $ ruangan

c data card
kcode 10000 1 10 100
ksrc  0 0 0
m1    92235.           0.024212  $MAT1
      92238.           0.241714 
      8016.            0.468777 
m2    2004.                 1  $MAT2
m3    40091.                1  $MAT3
m4    6012.                 1  $MAT4
m5    26000.                1  $MAT5
m6    6000.           0.00015  $MAT6
      7014.           0.78443 
      8016.           0.21075 
      18000.          0.00467 
imp:n 1 53r 0 $ 1, 55