function [x] = Solve(A,b)
% Funkcja rozwiązuje układ równań Ax=b dla macierzy trójdiagonalnej za
% pomocą algorytmu Thomasa
% A - macierz rozmiaru 3xn przedstawiona w postaci 
% [podprzekątna,diagonala, nadprzekątna]
% b - wektor wierszowy rozmiaru n
% x - rozwiązanie

% liczba wierszy macierzy A
n = length(A);

% zapisujemy przekątne jako wektory
e = A(1,:);
f = A(2,:);
g = A(3,:);

% algorytm Thomasa
for i = 2:n
    w = e(i)/f(i-1);
    f(i) = f(i) - w*g(i-1);
    b(i) = b(i) - w*b(i-1);
end
x(n) = b(n)/f(n);
for i=n-1:-1:1
    x(i) = (b(i) - g(i)*x(i+1))/f(i);
end
x = x';
end



