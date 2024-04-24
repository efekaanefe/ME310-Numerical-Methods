function x = jacobi(A, b, initial_guess, tol, max_iter, lambda)

    n = length(b);
    x_old = initial_guess; 
    x_new = zeros(n, 1); 
    
    for iter = 1:max_iter
        % Update each component of x_new using the Jacobi formula
        for i = 1:n
            % sum = 0;
            % for j = 1:n
            %     if j ~= i
            %         sum = sum + A(i, j) * x_old(j);
            %     end
            % end
            sum = A(i, [1:i-1, i+1:n]) * x_old([1:i-1, i+1:n]);

            x_new(i) = (b(i) - sum) / A(i, i);
        end
        
        if norm(x_new - x_old, inf) < tol
            break;
        end
        
        x_old = lambda * (x_new) + (1-lambda)*x_old;
    end
    
    x = x_new;
end
