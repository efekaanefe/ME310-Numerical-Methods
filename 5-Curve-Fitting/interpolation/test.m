clc; clear
format long

%% Inputs
x = [1 2 3 4 5 6 7]';
y = [0.5 2.5 2 4 3.5 6 5.5]';
x_fit = linspace(1, 7, 100);

x = [1; 2; 3; 4];
y = [3; 6; 2; 7];
x_fit = linspace(1, 4, 100);

%% INTERPOLATION

% Linear Interpolation
% y_fit = linear_interpolation(x, y, x_fit);

% Newton Interpolation Polynomial
% y_fit = newton_interpolating_polynomial(x, y, x_fit);

% Lagrange Interpolation Polynomial
% y_fit = lagrange_interpolating_polynomial(x, y, x_fit);


% Cubic Spline Interpolation
y_fit = quadratic_spline_interpolation(x, y, x_fit);


%% test plots
plot(x_fit, y_fit)
hold on
scatter(x, y)

