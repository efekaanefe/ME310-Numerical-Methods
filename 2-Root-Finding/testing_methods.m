clc; clear; close all;

%% global hyper-parameters

func = @(x) x^3 - 2*x - 5;
interval = [0, 10];
%% exact solution and plotting

exact_root = fzero(func, interval);
% fplot(func, interval)

%% incremental search

delta_x = 0.01;
roots = incremental_search(func, interval, delta_x);

disp('Exact root:');
disp(exact_root);
disp('Potential roots:');
disp(roots);
