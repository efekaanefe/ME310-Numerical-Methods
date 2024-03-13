function root = secant_method(func, x0, x1, tol, max_iter)
    iter = 0;
    
    while iter < max_iter
        f0 = func(x0);
        f1 = func(x1);
        
        if f1 - f0 == 0
            error('Division by zero. Unable to continue.');
        end
        
        x_next = x1 - f1 * (x1 - x0) / (f1 - f0);
        
        if abs(x_next - x1) < tol
            root = x_next;
            return;
        end
        
        x0 = x1;
        x1 = x_next;
        
        iter = iter + 1;
    end
    
    warning('Maximum number of iterations reached without convergence.');
    root = x_next; 
end
