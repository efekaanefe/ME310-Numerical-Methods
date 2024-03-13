clc; clear;

x_values = linspace(0.995, 1.005, 101);

expanded_values = x_values.^6 - 6*x_values.^5 + 15*x_values.^4 - 20*x_values.^3 + 15*x_values.^2 - 6*x_values + 1;
factored_values = (x_values - 1).^6;

plot(x_values, expanded_values, 'b-', x_values, factored_values, 'r--', 'LineWidth', 1.5);
xlabel('x');
ylabel('Polynomial Value');
title('Comparison of Expanded and Factored Forms of Polynomial');
legend('Expanded Form', 'Factored Form', 'Location', 'NorthEast');
grid on;

