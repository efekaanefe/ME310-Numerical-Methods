% METU ME310 Spring 2024
% Author: Cuneyt Sert
%
% This function finds the root of a given function using the Newton-Raphson
% method.
%
% How to use: The code is composed of one function called NewtonRaphson.
%             To use it you need to provide five arguments
%             - Function
%             - Derivative of the function
%             - Initial guess
%             - Tolerance
%             - Maximum iteration number


function root = NewtonRaphson(f, df, tol, maxIter, initialGuess)

oldRoot = initialGuess;

for i = 1:maxIter
    root = oldRoot - f(oldRoot) / df(oldRoot);   % Newton-Raphson formula
    
    if abs((root - oldRoot)/oldRoot) < tol   % Convergence check
        return;
    end
        
    oldRoot = root;   % Get ready for the new iteration
end

fprintf('WARNING!!! maxIter is reached before convergence.\n');

end  % of the function
