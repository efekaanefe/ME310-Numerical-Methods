clc; clear; close all;

%% inputs

% A = [2 -1 1; 1 1 -1; 3 2 1];
% b = [5; 0; 9];
A = [4, -1, 0; -1, 4, -1; 0, -1, 3];
b = [12; -1; 0];
n = length(b);

tol = 1e-5;
max_iter = 10000;
lambda = 1; % relaxation
initial_guess = ones(n,1);

%% tests

% x = cramer(A, b);
% x = gaussian_elimination(A,b);
% [x, L, U] = lu_decomposition(A,b)
% x = jacobi(A, b, initial_guess, tol, max_iter, lambda);
x = gauss_seidel(A, b, initial_guess, tol, max_iter, lambda);

disp('Solution:');
disp(x);