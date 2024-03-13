function root = modified_secant_method(func, x0, delta_x, tol, max_iter)
    iter = 0;
    
    while iter < max_iter
        f0 = func(x0);
        f1 = func(x0 + delta_x * x0);
        
        if f1 - f0 == 0
            error('Division by zero. Unable to continue.');
        end
        
        x_next = x0 - f0 * delta_x * x0 / (f1 - f0);
        
        if abs(x_next - x0) < tol
            root = x_next;
            return;
        end
        
        x0 = x_next;
        
        iter = iter + 1;
    end
    
    warning('Maximum number of iterations reached without convergence.');
    root = x_next;
end
