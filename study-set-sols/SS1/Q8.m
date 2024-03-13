clc; clear;

for k = 1:15
    x = 10^(-k);
    y = (exp(x) - 1) / x;
    fprintf("x = %.15f | y = %.20f \n", x,y)
end

disp("---------------------------------------------------")

for k = 1:15
    x = 10^(-k);
    y = (exp(x) - 1) / log(exp(x));
    fprintf("x = %.15f | y = %.20f \n", x,y)
end
