function root = inverse_quadratic_interpolation(func, x0, x1, x2, tol, max_iter)
    iter = 0;
    
    while iter < max_iter
        y0 = func(x0);
        y1 = func(x1);
        y2 = func(x2);

        term1 = (y1*y2)/((y0 - y1)*(y0 - y2)) * x0;
        term2 = (y0*y2)/((y1 - y0)* (y1 - y2)) * x1; % I think there is a typo in eq (6.9) in the book
        term3 = (y0*y1)/((y2 - y0)*(y2 - y1))*x2;
        xnew = term1 + term2 + term3;

        if abs(func(xnew)) < tol
            root = xnew;
            return;
        end

        x0 = x1;
        x1 = x2;
        x2 = xnew;
        
        iter = iter + 1;
    end
    
    warning('Maximum number of iterations reached without convergence.');
    root = xnew; 
end
