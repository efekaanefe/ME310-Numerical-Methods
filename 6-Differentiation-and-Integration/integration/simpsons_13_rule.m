function integral = simpsons_13_rule(f, a, b, n)
    % Newton-Cotes with n=2

    if mod(n, 2) ~= 0
        error('Number of subintervals must be even.');
    end
    
    h = (b - a) / n;
    
    integral = f(a) + f(b);
    
    for i = 1:n-1
        x = a + i * h;
        if mod(i, 2) == 0
            integral = integral + 2 * f(x);
        else
            integral = integral + 4 * f(x);
        end
    end
    
    integral = integral * h / 3;
end
