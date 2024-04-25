clc; clear; close all;
%% inputs for 1D, unconstrained methods
tol = 1e-5;
max_iter = 1000;
epsilon = 1e-5;
f = @(x) (x-4)^2;
df = @(x) (f(x+epsilon)-f(x))/epsilon;
a = 1; b = 10; % Initial interval bounds

%% tests for 1D, unconstrained methods
% [xmin, fmin] = golden_section_search(f, a, b, tol);
% [xmin, fmin] = quadratic_interpolation(f, a, b, tol, max_iter);
% [xmin, fmin] = newtons_method(f, df, a, tol, max_iter);

% fprintf('Minimum point: x = %.2f, f(x) = %.2f\n', xmin, fmin);

%% tests for 2D, unconstrained methods

% objective_function = @(x, y) x^2 + y^2;
% search_space = [-5 5; -5 5]; % Search space for x and y
% [bestSolution, bestObjective] = random_search(objective_function, search_space, max_iter);
% fprintf('Best solution: (%.4f, %.4f)\n', bestSolution);
% fprintf('Best objective value: %.4f\n', bestObjective);


f = @(x, y) -1*(y-x-2*x^2-2*x*y-y^2);
x_range = linspace(-10, 10, 100);
y_range = linspace(-10, 10, 100);
[optimal_x, optimal_y, min_fval] = univariate_search(f, x_range, y_range); 
fprintf('Optimal value of x: %.4f\n', optimal_x);
fprintf('Optimal value of y: %.4f\n', optimal_y);
fprintf('Optimal value of f(x,y): %.4f\n', min_fval);


f = @(x, y) -1*(y-x-2*x^2-2*x*y-y^2);
x0 = 1; y0 = 1;
[x_min, y_min, f_min] = powells_method(f, x0, y0, tol);
fprintf('Minimum point: (%.4f, %.4f)\n', x_min, y_min);
fprintf('Minimum value: %.4f\n', f_min);


% f = @(x, y) -1*(y-x-2*x^2-2*x*y-y^2);
f = @(x, y) x^2 + y^2;
% f = @(x, y) (x - 3)^2 + (y + 1)^2;
grad_f = @(x,y) [(f(x+epsilon,0)-f(x,0))/epsilon; (f(0,y+epsilon)-f(0,y))/epsilon];
x0 = 1; y0 = 1; 
learning_rate = 0.1;
[x_min, y_min, f_min] = gradient_method(f, grad_f, x0, y0, learning_rate, tol, max_iter);
fprintf('Minimum point: (%.4f, %.4f)\n', x_min, y_min);
fprintf('Minimum value: %.4f\n', f_min);
