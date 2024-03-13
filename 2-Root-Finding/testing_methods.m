clc; clear; close all;

%% initialize parameters

func = @(x) x^3 - 2*x - 5;
derivative_func = @(x) 3*x^2 - 2;

% g(x) for the one-point iteration
g = @(x) func(x) + x;

interval = [0, 5]; % interval for closed methods
x0 = 1; x1 = 2; % guesses for open methods
initial_guess = interval(1);
% initial_guess = 5;
delta_x = 0.01;
tol = 1e-6;
max_iter = 1000;

%% exact solution and plotting

exact_root = fzero(func, interval);
% fplot(func, interval)

%% results
roots_incremental_search = incremental_search(func, interval, delta_x);
root_bisection_method = bisection(func, interval, tol, max_iter);
root_false_position = false_position(func, interval, tol, max_iter);
root_one_point_iteration = one_point_iteration(g, initial_guess, tol, max_iter);
root_newton_raphson = newton_raphson(func, derivative_func, initial_guess, tol, max_iter);
root_secant_method = secant_method(func, x0, x1, tol, max_iter);
root_modified_secant_method = modified_secant_method(func, x0, delta_x, tol, max_iter);

disp('Exact root:');
disp(exact_root);
disp('Incremental search:');
disp(roots_incremental_search);
disp('Bisection:');
disp(root_bisection_method);
disp('False-Position:');
disp(root_false_position);
disp('One-Point-Iteration:');
disp(root_one_point_iteration);
disp('Newton-Raphson:');
disp(root_newton_raphson);
disp('Secant:');
disp(root_secant_method);
disp('Modified Secant:');
disp(root_modified_secant_method);

