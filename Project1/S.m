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

% Kwadratura ze względu na zmienną y
% stosowana do gotowej kwadratury ze względu na zmienną x
sum = 0;
y = S_x(f,c,a,b,N);
for k = 1:N
    sum = sum + S_x(f,y+H/2,a,b,N);
    y = y + H;
end
sum = sum * H;
end