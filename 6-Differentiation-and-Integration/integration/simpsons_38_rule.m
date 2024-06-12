function integral = simpsons_38_rule(f, a, b, n)
    % Newton-Cotes with n=3
    
    if mod(n, 3) ~= 0
        error('Number of subintervals must be a multiple of 3.');
    end
    
    h = (b - a) / n;
    
    integral = f(a) + f(b);
    
    for i = 1:n-1
        x = a + i * h;
        if mod(i, 3) == 0
            integral = integral + 2 * f(x);
        else
            integral = integral + 3 * f(x);
        end
    end
    
    integral = integral * 3 * h / 8;
end
