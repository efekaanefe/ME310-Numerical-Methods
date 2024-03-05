clc
format long
% https://www.sfu.ca/math-coursenotes/Math%20158%20Course%20Notes/sec_Numerical_Integration.html

% problem is integrating a various functions numerically

a = 0; b = 1;
N = 100;
f = @(x) sin(x)/(1+x);


% methods: upper, lower, midpoint, trapezoid, simpson
exact =  0.284226985512411201338819;

% errors
% calculateIntegral(f,a,b,N, "upper") - exact
% calculateIntegral(f,a,b,N, "lower") - exact
% calculateIntegral(f,a,b,N, "midpoint") - exact
calculateIntegral(f,a,b,N, "trapezoid") - exact
calculateIntegral(f,a,b,N, "simpson") - exact

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
            % for n=2 polynomial
            % x1 = a+dx*(i-1);
            % x2 = a+dx*(i-1/2);
            % x3 = a+dx*(i);
            % A = [x1^2,x1,1;x2^2,x2,1;x3^2,x3,1];
            % b = [f(x1);f(x2);f(x3)];
            % coef_vec = linsolve(A,b);
            % area = (coef_vec(1) * x3^3/3 +  coef_vec(2) * x3^2/2 + coef_vec(3) * x3) - ...
            % (coef_vec(1) * x1^3/3 + coef_vec(2) * x1^2/2 + coef_vec(3) * x1);

            x1 = a+dx*(i-1); % subinterval start
            x2 = a+dx*(i); % subinterval end
            n = 2;
            A = zeros(n+1);
            b = zeros(n+1,1);
            for j = 1:n+1
                xij = x1+dx*(j-1)/n;
                for k=1:n+1
                    A(j,k) = xij^(n+1-k);
                end
                b(j) = f(xij);
            end
            coef_vec = linsolve(A,b);
            area = 0;
            for j=1:n+1
                area = area + coef_vec(j)/(n+2-j)*(x2^(n+2-j)-x1^(n+2-j));
            end
        end
        sum = sum + area;
    end
end

