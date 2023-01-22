function [y] = griewank(xx)
% GRIEWANK FUNCTION
% INPUT: xx = [x1, x2, ..., xd]
% f(x) = 1 + { [((1/4000)(x1^2))+((1/4000)(x2^2))+
%               ((1/4000)(x3^2))+...+((1/4000)(xd^2))] - 
%              [(cos(x1/?1))*(cos(x2/?2))*
%               (cos(x3/?3))*...*(cos(xd/?d))] }
d = length(xx);
sum = 0;
prod = 1;
for ii = 1:d
	xi = xx(ii);
	sum = sum + xi^2/4000;
	prod = prod * cos(xi/sqrt(ii));
end
y = 1 + sum - prod;
end
