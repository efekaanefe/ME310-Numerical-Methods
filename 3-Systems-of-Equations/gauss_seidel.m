function x = gauss_seidel(A, b, inital_guess, tol, max_iter, lambda)
    
    n = length(b);
    x_old = inital_guess; 
    x_new = zeros(n, 1);
    
    for iter = 1:max_iter
        % Update each component of x_new using the Gauss-Seidel formula
        for i = 1:n
            sum1 = A(i, 1:i-1) * x_new(1:i-1);
            sum2 = A(i, i+1:n) * x_old(i+1:n);
            x_new(i) = (b(i) - sum1 - sum2) / A(i, i);
        end
        
        if norm(x_new - x_old, inf) < tol
            break;
        end
        
        x_old = lambda * (x_new) + (1-lambda)*x_old;
    end
    
    x = x_new;
end