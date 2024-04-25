function [x_min, y_min, f_min] = newtons_method_2d(f, grad_f, hessian_f, x0, y0, tol, max_iter)
    % Initialize starting point
    x_curr = x0;
    y_curr = y0;
    f_curr = f(x_curr, y_curr);
    
    % Perform Newton's method
    iter = 0;
    while true
        % Compute gradient and Hessian at current point
        grad_curr = grad_f(x_curr, y_curr);
        hessian_curr = hessian_f(x_curr, y_curr);
        
        % Update current point using Newton's method
        delta = -inv(hessian_curr) * grad_curr;
        x_next = x_curr + delta(1);
        y_next = y_curr + delta(2);
        
        % Update current function value
        f_next = f(x_next, y_next);
        
        % Check for convergence based on change in function value
        if abs(f_next - f_curr) < tol || iter >= max_iter
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
