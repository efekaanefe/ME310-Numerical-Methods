function root = newton_raphson(func, derivative_func, initial_guess, tol, max_iter)
    iter = 0;
    x = initial_guess;
    
    while iter < max_iter
        % Evaluate function and its derivative at current point
        fx = func(x);
        % dfx = derivative(func, x);
        dfx = derivative_func(x);
        
        % Check for division by zero in derivative
        if dfx == 0
            error('Derivative is zero. Unable to continue.');
        end
        
        % Compute next approximation using Newton-Raphson formula
        x_next = x - fx / dfx;
        
        % Check for convergence
        if abs(x_next - x) < tol
            root = x_next;
            return;
        end
        
        % Update iteration count and current approximation
        iter = iter + 1;
        x = x_next;
    end
    
    % Warning for maximum iterations reached without convergence
    warning('Maximum number of iterations reached without convergence.');
    root = x; % Return the last computed approximation
end

% Function to compute the derivative of a function at a point using central differences
function df = derivative(func, x)
    h = 1e-6; % Small perturbation
    df = (func(x + h) - func(x - h)) / (2 * h);
end
