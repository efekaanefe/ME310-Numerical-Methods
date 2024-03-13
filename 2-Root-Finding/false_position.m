function root = false_position(func, interval, tol, max_iter)
    a = interval(1);
    b = interval(2);
    
    if func(a) * func(b) >= 0
        error('The function has the same sign at the endpoints of the interval. Unable to find a root.');
    end
    
    iter = 0;
    root = [];
    
    while iter < max_iter
        c = b - (func(b)*(a-b))/(func(a)-func(b));
        
        if abs(func(c)) < tol
            root = c;
            break;
        end
        
        if func(a) * func(c) < 0
            b = c;
        else
            a = c;
        end
        
        iter = iter + 1;
    end
    
    if iter == max_iter
        warning('Maximum number of iterations reached without convergence.');
    end
end
