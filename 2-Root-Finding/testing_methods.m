clc; clear; close all;

%% initialize parameters
func = @(x) x^3 - 2*x - 5;
derivative_func = @(x) 3*x^2 - 2;

% g(x) for the one-point iteration
g = @(x) func(x) + x;

interval = [0, 5]; % interval for closed methods
x0 = 1; x1 = 1.1; x2 = 1.2; % guesses for open methods
delta_x = 0.01;
tol = 1e-6;
max_iter = 1000;

%% exact solution and plotting
exact_root = fzero(func, interval);
% fplot(func, interval)

%% results
roots_incremental_search = incremental_search(func, interval, delta_x)
root_bisection_method = bisection(func, interval, tol, max_iter)
root_false_position = false_position(func, interval, tol, max_iter)
root_one_point_iteration = one_point_iteration(g, x0, tol, max_iter)
root_newton_raphson = newton_raphson(func, derivative_func, x0, tol, max_iter)
root_secant_method = secant_method(func, x0, x1, tol, max_iter)
root_modified_secant_method = modified_secant_method(func, x0, delta_x, tol, max_iter)
root_quadratic_interpolation = quadratic_interpolation(func, x0, x1, x2, tol, max_iter)

