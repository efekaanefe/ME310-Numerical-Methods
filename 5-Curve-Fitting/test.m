clc; clear
format long

%% Input
% x = [1 2 3 4 5 6 7]';
% y = [0.5 2.5 2 4 3.5 6 5.5]';

x = linspace(-10, 10, 100)';
y = 3*x.^3 - 2*x.^2 + x + 5 + randn(size(x))*100; % Polynomial with noise

%% LEAST SQUARES REGRESSION

% Linear Regression 
% y_fit = linear_regression(x,y);

% Polynomial Regression
y_fit = polynomial_regression(x,y,2);
 

%% test plots
plot(x, y_fit)
hold on
scatter(x, y)