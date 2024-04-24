clear; close all

% Part (a): Solve the 5x5 system with Hilbert matrix
n = 5; % Size of the system
H = hilb(n); % Generate Hilbert matrix
exact_solution = ones(n, 1); % Exact solution vector
b = H * exact_solution; % Right-hand-side vector

% Solve the system using MATLAB's backslash operator
approximate_solution = H \ b;

% Calculate relative forward and backward errors
backward_error = norm(b - H * approximate_solution, inf) / norm(b, inf);
forward_error = norm(exact_solution - approximate_solution, inf) / norm(exact_solution, inf);

% Calculate error magnification factor
error_magnification_factor = forward_error / backward_error;

% Calculate condition number of the system
condition_number = cond(H, inf);

% Display results
fprintf('Part (a):\n');
fprintf('Backward Error: %.5e\n', backward_error);
fprintf('Forward Error: %.5e\n', forward_error);
fprintf('Error Magnification Factor: %.5e\n', error_magnification_factor);
fprintf('Condition Number: %.5e\n\n', condition_number);

% Part (b): Repeat for a 10x10 system
n = 10; % Size of the system
H = hilb(n); % Generate Hilbert matrix
exact_solution = ones(n, 1); % Exact solution vector
b = H * exact_solution; % Right-hand-side vector

% Solve the system using MATLAB's backslash operator
approximate_solution = H \ b;

% Calculate relative forward and backward errors
backward_error = norm(b - H * approximate_solution, inf) / norm(b, inf);
forward_error = norm(exact_solution - approximate_solution, inf) / norm(exact_solution, inf);

% Calculate error magnification factor
error_magnification_factor = forward_error / backward_error;

% Calculate condition number of the system
condition_number = cond(H, inf);

% Display results
fprintf('Part (b):\n');
fprintf('Backward Error: %.5e\n', backward_error);
fprintf('Forward Error: %.5e\n', forward_error);
fprintf('Error Magnification Factor: %.5e\n', error_magnification_factor);
fprintf('Condition Number: %.5e\n\n', condition_number);
