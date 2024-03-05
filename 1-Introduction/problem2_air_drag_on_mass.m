clc
format long
%% problem statement
% a mass is falling and it has air drag applied to it
% find the velocity as a function of time

% F = ma -> mg - c * v^2 = m * dv/dt

%% inputs
m = 5;
g = 9.81;
c = 1; % drag coef
%% exact sol
syms t
exact_sol = sqrt(m*g/c) * tanh(sqrt(c*g/m) * t);
% fplot(exact_sol, [0, 5])
%% numerical sol
dt = 0.01;
v0 = 0;
velocities = [v0];

for t = dt:dt:5
    % explicit i guess..
    vi_last =  velocities(end);
    vi = dt * (g-c/m*vi_last^2) + vi_last;
    velocities(end+1) = vi;
end 

plot(0:dt:5, velocities)