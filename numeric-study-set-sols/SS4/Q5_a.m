clc;clear;


% Define the function
f = @(x) 5*x(1)^4 + 4*x(1)^2*x(2) - x(1)*x(2)^3 + 4*x(2)^4 - x(1);

% Initial guess
x0 = [4, 5];

% Perform optimization
[x_min, f_min] = fminsearch(f, x0);

% Display result
disp(['Minimum value of f(x, y) = ', num2str(f_min)]);
disp(['Location of minimum: (x, y) = (', num2str(x_min(1)), ', ', num2str(x_min(2)), ')']);
