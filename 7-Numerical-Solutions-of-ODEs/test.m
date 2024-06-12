clc; clear;

%% inputs for initial value problem
% dy/dt = f
f = @(t, y) -2 * y;

t0 = 0;  
y0 = 1;  
h = 0.1;  
n = 50; 

%% Solution

% [t, y] = eulers_method(f, t0, y0, h, n); 
% [t, y] = heuns_method(f, t0, y0, h, n); 
% [t, y] = midpoint_method(f, t0, y0, h, n);
% [t, y] = rk4_method(f, t0, y0, h, n);
% [t, y] = adams_bashforth(f, t0, y0, h, n, 'AB4');
[t, y] = adams_moulton(t0, y0, h, n, 'AM2');

% known solution
y_exact = y0 * exp(-2 * t);
t_exact = t;


%% Plot the results

figure;
scatter(t, y);
hold on
plot(t_exact, y_exact)
legend(["approximate", "exact"])
xlabel('t');
ylabel('y');
title('Solution of dy/dt = -2y');
grid on;


%% inputs for boundary value problem


