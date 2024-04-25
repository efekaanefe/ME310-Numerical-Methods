function [x_min, y_min, f_min] = gradient_method(f, grad_f, x0, y0, learning_rate, tol, max_iter)
    % Initialize starting point
    x_curr = x0;
    y_curr = y0;
    f_curr = f(x_curr, y_curr);
    
    % Perform gradient descent
    iter = 0;
    while true
        % Compute gradient at current point
        grad_curr = grad_f(x_curr, y_curr);
        
        % Update current point using gradient descent
        x_next = x_curr - learning_rate * grad_curr(1);
        y_next = y_curr - learning_rate * grad_curr(2);
        
        % Update current function value
        f_next = f(x_next, y_next);
        
        % Check for convergence based on change in function value
        if norm([x_next - x_curr, y_next - y_curr]) < tol || iter >= max_iter
            fprintf('Converged in %d iterations.\n', iter);
            break;
        end
        
        % Update current point and function value for next iteration
        x_curr = x_next;
        y_curr = y_next;
        f_curr = f_next;
        
        iter = iter + 1;
    end
    
    x_min = x_curr;
    y_min = y_curr;
    f_min = f_curr;
end
