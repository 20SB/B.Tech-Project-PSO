function [Tcost]=ieee30G6(Pg)

%Solving ED problem for IEEE 30 bus 6 generator system

totPd=2.834;%pu
ng=6;
%a+bPgi+cPgi2
a=[10 10 20 10 20 10];
b=[200 150 180 100 180 150];
c=[100 120 40 60 40 100];
%0.01*(alpha+beta*Pgi+gamma*Pgi2)+zeta*exp(lambda*Pgi)
d=[4.091 2.543 4.258 5.326 4.258 6.131];%alpha
e=[-5.554 -6.047 -5.094 -3.550 -5.094 -5.555];%beta
f=[6.490 5.638 4.586 3.380 4.586 5.151];%gamma
g=[2.0e-04 5.0e-4 1e-6 2e-3 1e-6 1e-5];%zeta
h=[2.857 3.333 8.000 2.000 8.000 6.667];%phi
Pmin=[0.05 0.05 0.05 0.05 0.05 0.05];
Pmax=[0.50 0.60 1.00 1.20 1.00 0.60];

Tcost=0;
F=zeros(1,ng); 
for i=1:ng
    F(i)=a(i)+b(i)*Pg(i)+c(i)*(Pg(i)^2);
    Tcost=Tcost+F(i);
    
end
