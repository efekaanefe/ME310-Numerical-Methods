clc; clear; close all;


A = [2 -1 1; 1 1 -1; 3 2 1];
b = [5; 0; 9];

% x = cramer(A, b);
% x = gaussian_elimination(A,b);
x = lu_decomposition(A,b);

disp('Solution:');
disp(x);