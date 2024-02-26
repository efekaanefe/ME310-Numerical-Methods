clc; clear
format long

%% Example 17.1 - Find the best fit line
% Numerical Methods for Engineers, by Chapra 8th ed
x = [1 2 3 4 5 6 7];
y = [0.5 2.5 2 4 3.5 6 5.5];

%% solution
n = size(x, 2);

a1 = (n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.^2)-sum(x)^2)
a0 = mean(y) - a1 * mean(x)

plot(a1*x+a0)
hold on
plot(x, y, "ok")