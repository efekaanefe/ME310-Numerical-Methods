clc; clear
format long

%% Inputs
x = [1 2 3 4 5 6 7]';
y = [0.5 2.5 2 4 3.5 6 5.5]';

% x = linspace(-10, 10, 100)';
% y = 3*x.^3 - 2*x.^2 + x + 5 + randn(size(x))*100; 

% x = linspace(-10, 10, 100)';
% y = 1*exp(0.5 * x) + randn(size(x))*10; 

% x = linspace(1, 10, 100); 
% y = 2 * x.^1.5 + randn(size(x)) * 5; 

% x = linspace(0, 10, 100); 
% y = 3 * sin(x) + 2 * exp(-x.^2) + randn(size(x)) * 0.1; 
%% LEAST SQUARES REGRESSION

% Linear Regression 
% y_fit = linear_regression(x,y);

% Polynomial Regression
% y_fit = polynomial_regression(x,y,2);
 
% Exponential Regression
% y_fit = exponential_regression(x,y);
 
% Power Regression
% y_fit = power_regression(x,y);


%% test plots
plot(x, y_fit)
hold on
scatter(x, y)