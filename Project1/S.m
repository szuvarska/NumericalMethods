function [sum] = S(f,a,b,c,d,N)
% Funkcja stosuje złożoną kwadraturę prostokątów z punktem środkowym
% na funkcji f
% f - funkcja
% a,b - granice całkowania po pierwszej współrzędnej
% c,d - granice całkowania po drugiej współrzędnej
% N - liczba kroków
% sum - wyliczona wartość za pomocą kwadratury

% Długość podprzedziału
H = (d-c)/N;
h = (b-a)/N;

% Kwadratura ze względu na zmienną y
% stosowana do gotowej kwadratury ze względu na zmienną x
sum = 0;
for k = 1:N
    sum = sum + S_x(f,(k-0.5)*H,a,b,N);
end
sum = sum * H*h;
end