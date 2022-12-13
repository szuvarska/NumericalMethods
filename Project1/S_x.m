function [sum] = S_x(f,y,a,b,N)
% Funkcja stosuje złożoną kwadraturę prostokątów z punktem środkowym
% na funkcji f ze względu na zmienną x
% f - funkcja
% a,b - granice całkowania po x
% N - liczba kroków
% sum - wyliczona wartość za pomocą kwadratury

% Długość podprzedziału
H = (b-a)/N;

% Kwadratura ze względu na zmienną x
sum = 0;
for k = 1:N
    sum = sum + f((k-0.5)*H,y);
end
end

