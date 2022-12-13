function [output] = f(x,y)
% Funkcja, którą całkujemy
% x,y - argumenty funkcji
% output - wartość funkcji

output = exp(x.^3-y);

% Inne przykładowe funkcje:
%output = 1./sqrt(1-x.^2);
%output = (x./y).^10;
%output = sin(x-y);
%output = sqrt(x)+y;
%output = log(x.*y);

end