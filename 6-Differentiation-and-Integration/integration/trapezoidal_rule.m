function integral = trapezoidal_rule(f, a, b, n)
    % Newton-Cotes with n=1

    h = (b - a) / n;
    
    integral = 0.5 * (f(a) + f(b));
    
    for i = 1:n-1
        x = a + i * h;
        integral = integral + f(x);
    end
    
    integral = integral * h;
end
