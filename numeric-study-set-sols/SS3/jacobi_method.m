function [x, iterations] = jacobi_method(A, b, tolerance)
    % Initialize parameters
    N = size(A, 1);
    
    % Initialize solution vector
    x = zeros(N, 1);
    
    % Perform Jacobi iterations
    residual_norm = inf;
    iterations = 0;
    while residual_norm > tolerance
        x_new = zeros(N, 1);
        for i = 1:N
            x_new(i) = (b(i) - A(i,:) * x + A(i,i) * x(i)) / A(i,i);
        end
        residual_norm = norm(b - A * x_new, inf);
        x = x_new;
        iterations = iterations + 1;
    end
end