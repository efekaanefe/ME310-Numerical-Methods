clc
format long

a = 0; b = 1;
N = 50;
f = @(x) sin(x)^2/(1+x);

method = "midpoint"; % upper, lower, midpoint, trapezoid

sum = calculateIntegral(f,a,b,N, "midpoint")
sum2 = calculateIntegral(f,a,b,N, "upper")
sum3 = calculateIntegral(f,a,b,N, "lower")
sum3 = calculateIntegral(f,a,b,N, "trapezoid")

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
            if i == N
                area = 0;
            end
        end
        sum = sum + area;
    end
end

