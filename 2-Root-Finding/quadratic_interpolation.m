function root = quadratic_interpolation(func, x0, x1, x2, tol, max_iter)
    iter = 0;
    
    while iter < max_iter
        f0 = func(x0);
        f1 = func(x1);
        f2 = func(x2);
        
        a = ((f2 - f0) / (x2 - x0) - (f1 - f0) / (x1 - x0)) / (x2 - x1);
        b = (f1 - f0) / (x1 - x0) - a * (x1 + x0);
        c = f0 - a * x0^2 - b * x0;
        
        vertex_x = -b / (2 * a);
        
        if abs(vertex_x - x1) < tol
            root = vertex_x;
            return;
        end
        
        if vertex_x < x1
            x2 = x1;
            x1 = vertex_x;
        else
            x0 = x1;
            x1 = vertex_x;
        end
        
        iter = iter + 1;
    end
    
    warning('Maximum number of iterations reached without convergence.');
    root = vertex_x; 
end
