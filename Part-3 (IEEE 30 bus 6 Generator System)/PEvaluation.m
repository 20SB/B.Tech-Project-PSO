function [Pg]=PEvaluation(Pg)
totPd=2.834;
ng=6;
Pgsum=sum(Pg);
for i=1:ng
    Pg(i)=Pg(i)/Pgsum*totPd;
end