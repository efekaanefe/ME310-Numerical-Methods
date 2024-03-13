clc; clear; close all;

%% hyper-parameters

func = @(x) x^3 - 2*x - 5;
interval = [0, 5];
delta_x = 0.01;
tol = 1e-6;
max_iter = 1000;

%% exact solution and plotting

exact_root = fzero(func, interval);
% fplot(func, interval)

%% incremental search
roots_incremental_search = incremental_search(func, interval, delta_x);
root_bisection_method = bisection(func, interval, tol, max_iter);

disp('Exact root:');
disp(exact_root);
disp('Incremental search:');
disp(roots_incremental_search);
disp('Bisection:');
disp(root_bisection_method);

