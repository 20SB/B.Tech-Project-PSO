function [Pg]=PEvaluation(Pg)
totPd=2000;
ng=10;
Pgsum=sum(Pg);
for i=1:ng
    Pg(i)=Pg(i)/Pgsum*totPd;
end