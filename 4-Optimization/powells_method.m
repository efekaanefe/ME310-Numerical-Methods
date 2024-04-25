function [x_min, y_min, f_min] = powells_method(f, x0, y0, tol)
    % Initial point
    x_curr = x0;
    y_curr = y0;
    f_curr = f(x_curr, y_curr);
    
    % Search directions (initially along x and y axes)
    directions = eye(2);
    
    while true
        x_prev = x_curr;
        y_prev = y_curr;
        f_prev = f_curr;
        
        for i = 1:2
            % Define the objective function along the current direction
            phi = @(alpha) f(x_curr + alpha * directions(1, i), y_curr + alpha * directions(2, i)); % alpha is the step size
            
            % Perform a one-dimensional minimization
            alpha_min = fminsearch(phi, 0);
            
            % Update the current point
            x_curr = x_curr + alpha_min * directions(1, i);
            y_curr = y_curr + alpha_min * directions(2, i);
        end
        
        % Update the search directions
        delta_x = x_curr - x_prev;
        delta_y = y_curr - y_prev;
        directions(:, 1) = [delta_x; delta_y];
        
        % Check for convergence
        f_curr = f(x_curr, y_curr);
        if norm([x_curr - x_prev, y_curr - y_prev]) < tol || abs(f_curr - f_prev) < tol
            break;
        end
    end
    
    x_min = x_curr;
    y_min = y_curr;
    f_min = f_curr;
end
