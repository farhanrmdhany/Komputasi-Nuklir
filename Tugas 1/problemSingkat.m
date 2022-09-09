% problemSingkat.m

% Kelompok 3
%
%  1. Muhammad Farhan Ramadhany (18/431325/TK/47918)
%  2. Bagas Yadher Bima N.A.R.H. (18/431318/TK/47911)
%  3. Muhammad Syafiq Fauzan (18/4280979/TK/47481)
%  4. Valentinus Elzha Widatama (18/425242/TK/46937)
%  5. Imam Bayu Prasetya (18//TK/425231/TK/46926)


%% Mulai menjawab soal

%% Soal #1
%a
a = 10
%b
b = 2.5E23
%c
c = 2 + 3i
%d
d = e^(2*pi*j)/3

%% Soal #2
%a
aVec = [3.144 15 9 26]
%b
bVec = [2.71; 8; 28; 182]
%c
cVec = [5: -0.2: -5]
%d
dVec = logspace(0, 1, 100)
%e
eVec = ["Hello"]

%% Soal #3
%a
aMat = ones(9, 9) .* 2
%b
bMat = diag([1, 2, 3, 4, 5, 4, 3, 2, 1])
%c
cMat = reshape([1: 100], 10, 10)
%d
dMat = NaN(3, 4)
%e
eMat = [13 -1 5; -22 10 -87]
%f
pkg load communications;
fMat = floor(randint (5, 3, [-3,3]))

%% Soal #4
%a
x = 1 / (1+e^[(-1)*(a-15)/6])
%b
y = (sqrt(a)+sqrt(b^(1/10.5)))^pi
%c
z = log(real((c+d)*(c-d))*sin(a*pi/3))/(c*conj(c))

%% Soal #5
%a
xVec = (1 / sqrt(2 * pi * (2.5 ^ 2))) * e .^ ((-(cVec) .^ 2) ./ (2 * (2.5 ^ 2)))
%b
yVec = sqrt(aVec' .^ 2 + bVec .^ 2)
%c
zVec = log10(1 ./ dVec)

%% Soal #6
%a
xMat = (aVec * bVec) * (aMat^2)
%b
yMat = bVec * aVec
%c
zMat = (det(cMat)) * (aMat * bMat)'

%% Soal #7
%a
cSum = sum(cMat)
%b
eMean = mean(eMat)
%c
eMat(1,:) = 1
%d
cSub=cMat(2:9,2:9)
%e
lin = [1:20];
for i = 1:20
    if mod(lin(i), 2) == 0
        lin(i) = lin(i) * (-1);
    else
        continue
    end
end
disp(lin)
%f
r = rand(1, 5)
k = find(r<0.5);
r(k)= 0;
disp(r)
