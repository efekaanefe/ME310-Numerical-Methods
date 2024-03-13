function root = quadratic_interpolation(func, x0, x1, x2, tol, max_iter)
    iter = 0;
    
    while iter < max_iter
        y0 = func(x0);
        y1 = func(x1);
        y2 = func(x2);

        A = [x0^2 x0 1; 
             x1^2 x1 1; 
             x2^2 x2 1];
        b = [y0; y1; y2];
        coeffs = A\b;

        new_roots = roots(coeffs);

        % below line is hard-codded, which selects the biggest root directly
        % this is the reason why we need IQI method
        xnew = new_roots(1); 

        if abs(func(xnew)) < tol
            root = xnew;
            return;
        end

        x0 = x1;
        x1 = x2;
        x2 = xnew;
        
        % if xnew < x1
        %     x2 = x1;
        %     x1 = xnew;
        % else
        %     x0 = x1;
        %     x1 = xnew;
        % end
        
        iter = iter + 1;
    end
    
    warning('Maximum number of iterations reached without convergence.');
    root = vertex_x; 
end
