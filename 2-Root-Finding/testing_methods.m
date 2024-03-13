clc; clear; close all;

%% hyper-parameters

func = @(x) x^3 - 2*x - 5;

% Define the function g(x) for the one-point iteration method (e.g., x = x^2 - 2)
g = @(x) func(x) + x;

interval = [0, 5];
initial_guess = interval(1);
initial_guess = 2.5;
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

