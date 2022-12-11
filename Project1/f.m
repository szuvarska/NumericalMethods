function [output] = f(x,y)
% Funkcja, którą całkujemy
% x,y - argumenty funkcji
% output - wartość funkcji

output = exp(x.^3-y);

% Szczególne przypadki:
%output = (x./y).^10; %NaN
%output = 1./(x.^2+y.^2).^(3/2); %NaN
%output = 1./sqrt(abs(x))-1./sqrt(abs(y)); %NaN
%output = x; % przechylone koło
%output = 7; %liczy się, ale problem z wykresem
%output = sin(x-y); % dokładna wartość jest ujemna, a przybliżona dodatnia
%output = x.^5.*y+1; % wychodzi pi

end

