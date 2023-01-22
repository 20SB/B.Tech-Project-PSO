function [y] = rosen(xx)
% ROSENBROCK FUNCTION
% INPUT: xx = [x1, x2, ..., xd]
% f(x)= { [100*((x2-(x1^2))^2)+((x1-1)^2)] + 
%         [100*((x3-(x2^2))^2)+((x2-1)^2)] + 
%         [100*((x4-(x3^2))^2)+((x3-1)^2)] +....+ 
%         [100*((xd-(x(d-1)^2))^2)+((x(d-1)-1)^2)] }
d = length(xx);
sum = 0;
for ii = 1:(d-1)
	xi = xx(ii);
	xnext = xx(ii+1);
	new = 100*(xnext-xi^2)^2 + (xi-1)^2;
	sum = sum + new;
end
y = sum;
end
