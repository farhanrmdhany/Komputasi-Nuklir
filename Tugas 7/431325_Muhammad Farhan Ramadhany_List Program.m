clear all;clf;clc;
pkg load symbolic;
syms x y m n a;

%------------------SOAL 1-------------------------------------------
%T11.3-1 Given that y=sinh(3x) cosh(5x), use MATLAB 
%to find dy/dx at x = 0.2
dydx = diff(sinh(3*x)*cosh(5*x));
hasil1 = double(subs(dydx,x,0.2))

%------------------SOAL 2-------------------------------------------
%T11.3–2 Given that z = 5 cos(2x) ln(4y), use MATLAB to find dz/dy
%
hasil2 = diff(5*cos(2*x)*log(4*y),y)

%------------------SOAL 3-------------------------------------------
%T11.3–3 Given that y = x sin(3x), use MATLAB to find -y dx.
%
hasil3 = int(x*sin(3*x))

%------------------SOAL 4-------------------------------------------
%T11.3–4 Given that z = 6y^2 tan(8x), use MATLAB to find int. zdy
%
hasil4 = int(6*y^2*tan(8*x),y)

%----------------a--SOAL 5-------------------------------------------
%T11.3–5 Use MATLAB to evaluate int -2 to 5 (xsin(3x)dx)
%
hasil5 = double(int(x*sin(3*x),-2,5))

%------------------SOAL 6-------------------------------------------
%T11.3–6 Use MATLAB to find the first three nonzero terms in the
%Taylor series for cos x.
%
hasil6 = taylor(cos(x),x,'order',5)

%------------------SOAL 7-------------------------------------------
%T11.3–7 Use MATLAB to find a formula for the sum
%for m = 0:m-1 from m^3
%
hasil7 = symsum(m^3,0,m-1)

%------------------SOAL 8-------------------------------------------
%T11.3–8 Use MATLAB to evaluate summation m = 0:7 from cos(pi.n)
%
hasil8 = double(symsum(cos(pi*n),0,7))

%------------------SOAL 9-------------------------------------------
%T11.3–9 Use MATLAB to evaluate lim x>5 from (2x-10)/(x^3-125)
%
hasil9 = limit((2*x-10)/(x^3-125),5)

%------------------SOAL 10-------------------------------------------
%(a) Use MATLAB to solve the polynomial equation 
%x3 + 8x2 + ax + 10 = 0 for x in terms of the parameter a.
fungsi = x^3+8*x^2+a*x+10==0;
hasil10a = solve(fungsi,x)

%(b) Evaluate your solution for the case a = 17. 
%Use MATLAB to check the answer.
hasil10b = (double(subs(hasil10a,a,17)))

%------------------SOAL 11-------------------------------------------
%Find the Taylor series for e^x sin x about x = 0 in two ways: 
%(a) by multiplying the Taylor series for e^x and that for sin x
hh1 = taylor(exp(x),x);
hh2 = taylor(sin(x),x);
hasil11a = simplify(hh1*hh2)

%(b) by using the taylor function directly on e^x sin x.
hasil11b = simplify(taylor(exp(x)*sin(x),x,'order',11))