clc                                                                         % To clear the command window
clear                                                                       % To clear the workspace
close all

%% PROBLEM SETTING
lb = [0.05 0.05 0.05 0.05 0.05 0.05];                                      % Lower Bound
ub = [0.50 0.60 1.00 1.20 1.00 0.60];                                      % Upper Bound
prob = @ieee30G6Em;                                                         % Fitness Function

%% ALGORITHM PARAMETERS
Np = 10;                                                                    % Population size
T = 50;                                                                     % No. of Iterations
w = 0.8;                                                                    % Inertia weight
c1 = 1.5;                                                                   % Acceleration Coefficient 1
c2 = 1.5;                                                                   % Acceleration Coefficient 2
Pc = 1;                                                                     % Population Condition

Nruns = 10;
BestSol = NaN(Nruns,length(lb));
BestFitness = NaN(Nruns,1);
BestFitIter = NaN(Nruns,T+1);

for i = 1:Nruns
    rng(i,'twister')                            % For controlling random numbers generated by rand, randi
    [BestSol(i,:),BestFitness(i),BestFitIter(i,:)] = PSOf(prob,lb,ub,Np,T,w,c1,c2,Pc);
    plot(BestFitIter(i,:),'*')
    hold on
end
xlabel('Itertion')
ylabel('Best fitness Function Value')

p1=BestSol(:,1);
p2=BestSol(:,2);
p3=BestSol(:,3);
p4=BestSol(:,4);
p5=BestSol(:,5);
p6=BestSol(:,6);
tc=sum(BestSol,2);
colnames = {'P1' 'P2' 'P3' 'P4' 'P5' 'P6' 'Total'};
Load_Sharing = table(p1,p2,p3,p4,p5,p6,tc, 'VariableNames', colnames)

[a,ind] = min(BestFitness);
b = max(BestFitness);
c = mean(BestFitness);
d = median(BestFitness);
e = std(BestFitness);
colnames = {'Min' 'Max' 'Mean' 'maedian' 'Standard_Deviation'};
Statistical_Values = table(a, b, c, d, e, 'VariableNames', colnames)

Best_Soln = BestSol(ind,:)

figure
plot(mean(BestFitIter),'*');
xlabel('Itertion')
ylabel('Average of best fitness Function Value')