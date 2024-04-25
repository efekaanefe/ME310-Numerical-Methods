clc; clear; close all;
%% inputs for 1D, unconstrained methods
tol = 1e-5;
max_iter = 1000;
epsilon = 1e-5;
f = @(x) (x-4)^2;
df = @(x) (f(x+epsilon*x)-f(x))/epsilon;
a = 1; b = 10; % Initial interval bounds

%% tests for 1D, unconstrained methods
% [xmin, fmin] = golden_section_search(f, a, b, tol);
% [xmin, fmin] = quadratic_interpolation(f, a, b, tol, max_iter);
% [xmin, fmin] = newtons_method(f, df, a, tol, max_iter);

% fprintf('Minimum point: x = %.2f, f(x) = %.2f\n', xmin, fmin);

%% inputs for 2D, unconstrained methods


%% tests for 2D, unconstrained methods

% objectiveFunction = @(x, y) x^2 + y^2;
% searchSpace = [-5 5; -5 5]; % Search space for x and y
% [bestSolution, bestObjective] = random_search(objectiveFunction, searchSpace, max_iter);
% fprintf('Best solution: (%.4f, %.4f)\n', bestSolution);
% fprintf('Best objective value: %.4f\n', bestObjective);

objectiveFunction = @(x, y) -1*(y-x-2*x^2-2*x*y-y^2);
x_range = linspace(-10, 10, 100);
y_range = linspace(-10, 10, 100);
[optimal_x, optimal_y, min_fval] = univariate_search(objectiveFunction, x_range, y_range); 
fprintf('Optimal value of x: %.4f\n', optimal_x);
fprintf('Optimal value of y: %.4f\n', optimal_y);
fprintf('Optimal value of f(x,y): %.4f\n', min_fval);
