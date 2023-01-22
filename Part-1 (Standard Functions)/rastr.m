function [y] = rastr(xx)
% RASTRIGIN FUNCTION
% INPUT: xx = [x1, x2, ..., xd]
% f(x)=(10*d) + { [(x1^2)-(10*cos(2?x1))] + 
%                 [(x2^2)-(10*cos(2?x2))] + 
%                 [(x3^2)-(10*cos(2?x3))] +....+ 
%                 [(xd^2)-(10*cos(2?xd))] }
d = length(xx);
sum = 0;
for ii = 1:d
	xi = xx(ii);
	sum = sum + (xi^2 - 10*cos(2*pi*xi));
end
y = 10*d + sum;
end
