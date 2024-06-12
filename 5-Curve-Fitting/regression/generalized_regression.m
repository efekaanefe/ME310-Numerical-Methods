clc; clear;

%% input
x = linspace(0, 10, 100);
y = 3 * sin(x) + 2 * exp(-x.^2) + randn(size(x)) * 0.1; 

%% regression

X = [sin(x') exp(-x'.^2)];
coeffs = (X' * X) \ (X' * y');
a0 = coeffs(1);
a1 = coeffs(2);
y_fit = a0 * sin(x) + a1 * exp(-x.^2);


%% plot data and fitted curve
figure;
scatter(x, y, 'b', 'filled');
hold on;
plot(x, y_fit, 'r-', 'LineWidth', 2);
xlabel('x');
ylabel('y');
legend('Data', 'Fitted curve');
title('Fitting y = a0*sin(x) + a1*exp(-x^2)');
hold off;

