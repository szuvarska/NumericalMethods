function [output] = f_bieg(r,phi)
% Funkcja będąca funkcją f przekształconą na współrzędne biegunowe
% r, phi - argumenty funkcji (r - promień, phi - kąt)
% output - wartość funkcji

output = r.*f(r.*cos(phi),r.*sin(phi));
end

