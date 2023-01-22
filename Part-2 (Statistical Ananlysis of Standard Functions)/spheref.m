function [y] = spheref(xx)
% SPHERE FUNCTION
% INPUT: xx = [x1, x2, ..., xd]
% f(xx)=[(x1^2)+(x2^2)+(x3^2)+....+(xd^2)] 
d = length(xx);
sum = 0;
for ii = 1:d
	xi = xx(ii);
	sum = sum + xi^2;
end
y = sum;
end
