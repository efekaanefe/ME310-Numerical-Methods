clc; clear; close all;
%% inputs
tol = 1e-5;
max_iter = 1000;
epsilon = 1e-5;
f = @(x) (x-4)^2;
df = @(x) (f(x+epsilon*x)-f(x))/epsilon;
a = 1; b = 10; % Initial interval bounds

%% tests
% [xmin, fmin] = golden_section_search(f, a, b, tol);
% [xmin, fmin] = quadratic_interpolation(f, a, b, tol, max_iter);
[xmin, fmin] = newtons_method(f, df, a, tol, max_iter);

fprintf('Minimum point: x = %.2f, f(x) = %.2f\n', xmin, fmin);
