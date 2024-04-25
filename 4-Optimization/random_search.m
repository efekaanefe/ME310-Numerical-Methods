function [bestSolution, bestObjective] = random_search(objectiveFunction, searchSpace, maxIter)
    % Initialize best solution and objective value
    bestSolution = [];
    bestObjective = Inf;
    
    % Apply random search
    for iter = 1:maxIter
        % Generate a random candidate solution within the search space
        candidateSolution = generateRandomSolution(searchSpace);

        % Evaluate the objective function at the candidate solution
        objectiveValue = objectiveFunction(candidateSolution(1), candidateSolution(2));

        % Update the best solution if the objective value is better
        if objectiveValue < bestObjective
            bestSolution = candidateSolution;
            bestObjective = objectiveValue;
        end
    end

    % Function to generate a random solution within the search space
    function solution = generateRandomSolution(searchSpace)
        solution = [rand() * (searchSpace(1,2) - searchSpace(1,1)) + searchSpace(1,1), ...
                    rand() * (searchSpace(2,2) - searchSpace(2,1)) + searchSpace(2,1)];
    end
end