function root = one_point_iteration(g_func, initial_guess, tol, max_iter)
    iter = 0;
    x = initial_guess;
    
    while iter < max_iter
        % Compute next approximation using the formula: x_{i+1} = g(x_i)
        x_next = g_func(x);
        
        if abs(x_next - x) < tol
            root = x_next;
            return;
        end
        
        iter = iter + 1;
        x = x_next;
    end
    
    warning('Maximum number of iterations reached without convergence.');
    root = x;
end
