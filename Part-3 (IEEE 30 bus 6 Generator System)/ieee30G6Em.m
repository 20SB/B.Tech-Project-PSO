function [Temission]=ieee30G6Em(Pg)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%This is the objective function for minimum emission schedule IEEE 30G6%%%
% %@Author: Rajat Kanti Samal
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
ng=6;
totPd=2.834;%pu
%0.01*(alpha+beta*Pgi+gamma*Pgi2)+zeta*exp(lambda*Pgi)
d=[4.091 2.543 4.258 5.326 4.258 6.131];%alpha
e=[-5.554 -6.047 -5.094 -3.550 -5.094 -5.555];%beta
f=[6.490 5.638 4.586 3.380 4.586 5.151];%gamma
g=[2.0e-04 5.0e-4 1e-6 2e-3 1e-6 1e-5];%zeta
h=[2.857 3.333 8.000 2.000 8.000 6.667];%phi

E=zeros(1,ng); 
Temission=0;
for i=1:ng
    %Pg(i)=Pg(i)/Pgsum*totPd;
    E(i)=0.01*(d(i)+e(i)*Pg(i)+f(i)*(Pg(i)^2))+g(i)*exp(h(i)*Pg(i));
    Temission=Temission+E(i);
end