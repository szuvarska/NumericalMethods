% Jest to główny skrypt, w którym inicjalizujemy zmienne, rozwiązujemy
% układ Ax = b za pomocą metody dokładnej i przybliżonej BSOR, liczymy błąd
% względny i rysujemy jego wykres

%%% Przykład 1

A_diag = [0,1, 2, 3, 4; 5, 6, 7, 8, 9; 4, 3, 2, 1, 0]; % macierz trójdiagonalna (macierz rozmiaru 3xn przedstawiona w postaci 
% [podprzekątna,diagonala, nadprzekątna])
b = [1, 2, 3, 4, 5]; % wektor prawej strony równania
w = 1.2; % parametr relaksacji
n = length(A_diag);
x0 = zeros(n, 1); % wektor rozwiązania w 0-wej iteracji
d = 1e-16; % tolerancja dla warunku stopu
M = 1000; % maksymalna liczba iteracji

% rozwiązanie dokładne
x_dokl = Solve(A_diag,b);

% rozwiązanie za pomocą metody BSOR
[x, rho_B, cond_A, k] = BSOR(A_diag,b,w,x0,d,M);

% błąd względny
blad = (x-x_dokl)./x_dokl;

% rysowanie wykresu błędu w zależności od numeru x
figure; plot(1:n,blad,'r');
title('Wykres 1','FontSize',14);
xlabel('Numer współrzędnej x'); 
ylabel('Błąd względny');
xticks(1:n)
%annotation('textbox', [0.65, 0.85, 0.1, 0.1], 'String', "błąd = " + blad')
annotation('textbox', [0.25, 0.85, 0.1, 0.1], 'String', "promień spektralny = " + rho_B)
annotation('textbox', [0.25, 0.75, 0.1, 0.1], 'String', "wskaźnik uwarunkowania = " + cond_A)
annotation('textbox', [0.25, 0.65, 0.1, 0.1], 'String', "liczba iteracji = " + k)
annotation('textbox', [0.25, 0.55, 0.1, 0.1], 'String', "parametr relaksacji = " + w)
annotation('textbox', [0.25, 0.45, 0.1, 0.1], 'String', "tolerancja = " + d)


%%% Przykład 2
A_diag = [0,1,0,-2;1,-1,1,2;0,0,1,0]; % macierz trójdiagonalna (macierz rozmiaru 3xn przedstawiona w postaci 
% [podprzekątna,diagonala, nadprzekątna])
b = [3,-1,-2,1]; % wektor prawej strony równania
w = 1.2; % parametr relaksacji
n = length(A_diag);
x0 = zeros(n, 1); % wektor rozwiązania w 0-wej iteracji
d = 1e-16; % tolerancja dla warunku stopu
M = 1000; % maksymalna liczba iteracji

% rozwiązanie dokładne
x_dokl = Solve(A_diag,b);

% rozwiązanie za pomocą metody BSOR
[x, rho_B, cond_A, k] = BSOR(A_diag,b,w,x0,d,M);

% błąd względny
blad = (x-x_dokl)./x_dokl;

% rysowanie wykresu błędu w zależności od numeru x
figure; plot(1:n,blad,'r');
title('Wykres 2','FontSize',14);
xlabel('Numer współrzędnej x'); 
ylabel('Błąd względny');
xticks(1:n)
%annotation('textbox', [0.65, 0.85, 0.1, 0.1], 'String', "błąd = " + blad')
annotation('textbox', [0.25, 0.85, 0.1, 0.1], 'String', "promień spektralny = " + rho_B)
annotation('textbox', [0.25, 0.75, 0.1, 0.1], 'String', "wskaźnik uwarunkowania = " + cond_A)
annotation('textbox', [0.25, 0.65, 0.1, 0.1], 'String', "liczba iteracji = " + k)
annotation('textbox', [0.25, 0.55, 0.1, 0.1], 'String', "parametr relaksacji = " + w)
annotation('textbox', [0.25, 0.45, 0.1, 0.1], 'String', "tolerancja = " + d)

%%% Przykład 3
A_diag = [0,-1,-1;2.04,2.04,2.04;-1,-1,-1]; % macierz trójdiagonalna (macierz rozmiaru 3xn przedstawiona w postaci 
% [podprzekątna,diagonala, nadprzekątna])
b = [48.8,0.8,0.8]; % wektor prawej strony równania
n = length(A_diag);
x0 = zeros(n, 1); % wektor rozwiązania w 0-wej iteracji
d = 1e-16; % tolerancja dla warunku stopu
M = 1000; % maksymalna liczba iteracji

rho = [];

for w=-0.5:0.2:2.5
    [~, rho_B, ~, ~] = BSOR(A_diag,b,w,x0,d,M);
    rho = [rho rho_B];
end

% rysowanie wykresu błędu w zależności od numeru x
figure; plot(-0.5:0.2:2.5,rho,'b');
hold on
plot(-0.5:0.2:2.5,ones(length(-0.5:0.2:2.5)),'r')
title('Wykres 3','FontSize',14);
xlabel('Parametr relaksacji'); 
ylabel('Promień spektralny macierzy iteracji');
xticks(-0.5:0.2:2.5)

%%% Przykład 4
A_diag = [0,-1,-1;3,3,3;-1,-1,0]; % macierz trójdiagonalna (macierz rozmiaru 3xn przedstawiona w postaci 
% [podprzekątna,diagonala, nadprzekątna])
b = [-1,7,7]; % wektor prawej strony równania
w = 1.2; % parametr relaksacji
n = length(A_diag);
x0 = zeros(n, 1); % wektor rozwiązania w 0-wej iteracji
M = 1000; % maksymalna liczba iteracji

k_ = [];

for d = logspace(0,-16,17)
    [~, ~, ~, k] = BSOR(A_diag,b,w,x0,d,M);
    k_ = [k_ k];
end

% rysowanie wykresu błędu w zależności od numeru x
figure; loglog(logspace(0,-16,17),k_,'b');
title('Wykres 4','FontSize',14);
xlabel('Tolerancja warunku stopu (dokładność)'); 
ylabel('Liczba iteracji');

%%% Przykład 5
A_diag = [0,1,1,1,1,1,0;6,4,4,4,4,4,6;0,1,1,1,1,1,0]; % macierz trójdiagonalna (macierz rozmiaru 3xn przedstawiona w postaci 
% [podprzekątna,diagonala, nadprzekątna])
b = [0,1,2,-6,2,1,0]; % wektor prawej strony równania
n = length(A_diag);
x0 = zeros(n, 1); % wektor rozwiązania w 0-wej iteracji
d = 1e-15; % tolerancja dla warunku stopu
M = 1000; % maksymalna liczba iteracji

k_ = [];

for w=0:0.1:2
    [~, ~, ~, k] = BSOR(A_diag,b,w,x0,d,M);
    k_ = [k_ k];
end

% rysowanie wykresu błędu w zależności od numeru x
figure; plot(0:0.1:2,k_,'b');
title('Wykres 5','FontSize',14);
xlabel('Parametr relaksacji'); 
ylabel('Liczba iteracji');

%%% Przykład 6
A_diag = [0,0,0,0,0;0,0,0,0,0;0,0,0,0,0]; % macierz trójdiagonalna (macierz rozmiaru 3xn przedstawiona w postaci 
% [podprzekątna,diagonala, nadprzekątna])
b = [1,2,3,4,5]; % wektor prawej strony równania
w = 1.1; % parametr relaksacji
n = length(A_diag);
x0 = zeros(n, 1); % wektor rozwiązania w 0-wej iteracji
d = 1e-8; % tolerancja dla warunku stopu
M = 1000; % maksymalna liczba iteracji

% rozwiązanie dokładne
x_dokl = Solve(A_diag,b);

% rozwiązanie za pomocą metody BSOR
[x, rho_B, cond_A, k] = BSOR(A_diag,b,w,x0,d,M);

% błąd względny
blad = (x-x_dokl)./x_dokl;

% rysowanie wykresu błędu w zależności od numeru x
figure; plot(1:n,blad,'r');
title('Wykres 6','FontSize',14);
xlabel('Numer współrzędnej x'); 
ylabel('Błąd względny');
xticks(1:n)
%annotation('textbox', [0.65, 0.85, 0.1, 0.1], 'String', "błąd = " + blad')
annotation('textbox', [0.25, 0.85, 0.1, 0.1], 'String', "promień spektralny = " + rho_B)
annotation('textbox', [0.25, 0.75, 0.1, 0.1], 'String', "wskaźnik uwarunkowania = " + cond_A)
annotation('textbox', [0.25, 0.65, 0.1, 0.1], 'String', "liczba iteracji = " + k)
annotation('textbox', [0.25, 0.55, 0.1, 0.1], 'String', "parametr relaksacji = " + w)
annotation('textbox', [0.25, 0.45, 0.1, 0.1], 'String', "tolerancja = " + d)