function [BestSol,BestFitness,BestFitIter] = PSOf(prob,lb,ub,Np,T,w,c1,c2,Pc);
%% STARTING OF PSO
f = NaN(Np,1);                                 % Vector to store the fitness function value of the population size
BestFitIter = NaN(T+1,1);                      % Vector to store the best objective fitness function value at each iteration
D = length(lb);                                            % Determining the no of decision variables available
P = repmat(lb,Np,1) + repmat((ub-lb),Np,1).*rand(Np,D);    % Generation of the initial population
v = repmat(lb,Np,1) + repmat((ub-lb),Np,1).*rand(Np,D);    % Generation of the initial vector

for p = 1:Np
    if Pc == 1                                             % Checking Population Condition         
        P(p,:) = PEvaluation(P(p,:));
        v(p,:) = PEvaluation(v(p,:));
    end
    f(p) = prob(P(p,:));                                   % Determining the fitness function of the initial population
end
pbest = P;                                                 % Initializing the personal best solution
f_pbest = f;                                               % Initializing the fitness of the personal best solutions
[f_gbest,ind] = min(f_pbest);                              % Determining the best objective fitness function value
gbest = P(ind,:);                                          % Determining the best solutions
BestFitIter(1) = f_gbest;                                  % Initializing the best fitness value at initial iteration

for t = 1:T
    for p = 1:Np
        v(p,:) = w*v(p,:) + c1*rand(1,D).*(pbest(p,:) - P(p,:)) + c2*rand(1,D).*(gbest - P(p,:)); 
                                                           % Determine New Velocity
        P(p,:) = P(p,:) + v(p,:);                          % Update the position
        P(p,:) = max(P(p,:),lb);                           % Bounding the violating variables to their lower bound
        P(p,:) = min(P(p,:),ub);                           % Bounding the violating variables to their lower bound
        if Pc == 1                                         % Checking Population Condition         
            P(p,:) = PEvaluation(P(p,:));
        end
        f(p) = prob(P(p,:));                               % Determining the fitness of the new solution
        if f(p) < f_pbest(p)
            f_pbest(p) = f(p);                             % Updating the fitness function value of the personal best solution
            pbest(p,:) = P(p,:);                           % Updating the personal best solution
            if f_pbest(p) < f_gbest
                f_gbest = f_pbest(p);                      % Updating the fitness function value of the best solution
                gbest = pbest(p,:);                        % Updating the best solution
            end
        end
    end
    BestFitIter(t+1) = f_gbest;                            % Updating the best fitness value at (t+1) iteration

end
BestFitness = f_gbest;
BestSol = gbest;
end

