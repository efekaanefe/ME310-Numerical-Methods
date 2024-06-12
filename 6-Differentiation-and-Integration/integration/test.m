clc; clear;

%% inputs 
f = @(x) x.^2;
a = 0;
b = 1;
n = 12;
tol = 1e-6;

%%  Newton-Cotes integration methods 

integral_trapezoidal = trapezoidal_rule(f, a, b, n);
fprintf('Trapezoidal rule: %f\n', integral_trapezoidal);

integral_simpsons13 = simpsons_13_rule(f, a, b, n);
fprintf('Simpson''s 1/3 rule: %f\n', integral_simpsons13);

integral_simpsons38 = simpsons_38_rule(f, a, b, n);
fprintf('Simpson''s 3/8 rule: %f\n', integral_simpsons38);

integral = adaptive_simpsons13(f, a, b, tol);
fprintf('Adaptive Simpson''s rule: %f\n', integral);


%% Gauss-Quadrature integration method 
integral = gauss_quadrature(f, a, b, n);
fprintf('Gauss quadrature: %f\n', integral);