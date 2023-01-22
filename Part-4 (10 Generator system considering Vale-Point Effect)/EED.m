function [Tcost]=EED(Pg)
%Solving economic environmental dispatch (EED) problem for Micro Grid 6 generator system
%The fuel cost function of each fossil fuel fired generator
%considering the valve-point efffect into consideration

totPd=2000;%MW
ng=10;
%a+bPgi+cPgi2+|dsin{e(pimin-pi)}|
a=[1000.403 950.606 900.705  800.705 756.799 451.325 1243.531 1049.998 1658.569 1356.659]; %($/h)
b=[ 40.5407 39.5804 36.5104 39.5104  38.5390 46.1592 38.3055 40.3965  36.3278 38.2704]; %($/MWh)
c=[0.12951  0.10908  0.12511 0.12111 0.15247  0.10587  0.03546  0.02803 0.02111 0.01799]; %($/h)
d=[33 25 32 30 30 20 20 30 60 40]; %($/h)
e=[0.0174 0.0178 0.0162 0.0168  0.0148 0.0163 0.0152 0.0128 0.0136 0.0141]; %(rad/MW)
Pmin=[10 20 47 20 50 70 60 70 135 150]; %(MW)
Pmax=[55 80 120 130 160 240 300 340 470 470]; %(MW)

Tcost=0;
F=zeros(1,ng); 
for i=1:ng
    F(i)=a(i)+b(i)*Pg(i)+c(i)*(Pg(i)^2)+abs(d(i)*sin(e(i)*(Pmin(i)-Pg(i))));
    Tcost=Tcost+F(i);
    
end
