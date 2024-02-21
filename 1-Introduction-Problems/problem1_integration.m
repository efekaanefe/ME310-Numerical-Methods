clc
format long
% problem is integrating a various functions numerically

a = 0; b = 1;
N = 5000;
f = @(x) sin(x)/(1+x);

% methods: upper, lower, midpoint, trapezoid, simpson
exact =  0.284226985512411201338819;

% errors
calculateIntegral(f,a,b,N, "upper") - exact
calculateIntegral(f,a,b,N, "lower") - exact
calculateIntegral(f,a,b,N, "midpoint") - exact
calculateIntegral(f,a,b,N, "trapezoid") - exact


function sum = calculateIntegral(f,a,b,N, method)
    dx = (b-a)/N;
    sum = 0;
    for i = 1:N
        if method == "upper"
            area = f(a+dx*i) * dx;
        elseif method == "lower"
            area = f(a+dx*(i-1)) * dx;
        elseif method == "midpoint"
            area = f(a+dx*i-dx/2) * dx;
        elseif method == "trapezoid"
            area = (f(a+dx*(i-1)) + f(a+dx*i)) * dx/2;
        elseif method == "simpson"
            
        end
        sum = sum + area;
    end
end

