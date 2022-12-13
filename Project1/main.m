function [] = main()
% Funkcja tworzy wykres 3D funkcji f, oblicza dokładną wartość całki f
% i przybliżoną za pomocą złożonej kwadratury prostokątów z punktem środkowym 
% oraz błąd między tymi wartościami.

% Ustalenie granic całkowania po x
a = 0;
b = 1;

% Ustalenie granic całḱowania po y
c = 0;
d = 2*pi;

% Liczba podprzedziałów dla kwadratury złożonej
N = 1000;
M = 1000;

% Liczenie wartości całki na dwa sposoby i błędu
przyblizona_wartosc = S(@f_bieg,a,b,c,d,N,M)
dokladna_wartosc = integral2(@f_bieg,a,b,c,d)
blad = abs(dokladna_wartosc - przyblizona_wartosc)

% Tworzenie siatki do wykresu
[r, phi] = meshgrid(linspace(a,b),linspace(c,d));
X = r.*cos(phi);
Y = r.*sin(phi);
Z = f(X,Y);

% Rysowanie wykresu
figure
mesh(X,Y,Z);
title("f(x,y) = exp(x^3-y)")
%title("f(x,y) = 1/sqrt(1-x^2)")
%title("f(x,y) = (x/y)^{10}")
%title("f(x,y) = sin(x-y)")
%title("f(x,y) = sqrt(x)+y")
%title("f(x,y) = log(x*y)");
xlabel('x');
ylabel('y');
zlabel('f(x,y)')
annotation('textbox', [0.65, 0.85, 0.1, 0.1], 'String', "Dokładna całka =  " + dokladna_wartosc)
annotation('textbox', [0.65, 0.75, 0.1, 0.1], 'String', "Przybliżona całka = " + przyblizona_wartosc)
annotation('textbox', [0.65, 0.65, 0.1, 0.1], 'String', "Błąd = " + blad)
end

