function [xmin, fmin] = golden_section_search(f, a, b, tol)
    % Golden Section Search algorithm to find the minimum of a unimodal function
    
    % Golden ratio
    phi = (1 + sqrt(5)) / 2;
    
    % Initial points
    x1 = b - (b - a) / phi;
    x2 = a + (b - a) / phi;
    
    % Evaluate function at initial points
    f1 = f(x1);
    f2 = f(x2);
    
    % Iteration loop
    while abs(b - a) > tol
        if f1 < f2
            b = x2;
            x2 = x1;
            f2 = f1;
            x1 = b - (b - a) / phi;
            f1 = f(x1);
        else
            a = x1;
            x1 = x2;
            f1 = f2;
            x2 = a + (b - a) / phi;
            f2 = f(x2);
        end
    end
    
    % Return the minimum point and function value
    xmin = (a + b) / 2;
    fmin = f(xmin);
end
