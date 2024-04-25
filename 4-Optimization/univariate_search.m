function [optimal_x, optimal_y, min_fval] = univariate_search(f, x_range, y_range)
    % Initialize variables to store optimal values
    optimal_x = NaN;
    optimal_y = NaN;
    min_fval = Inf;

    % Iterate over the range of x values and find the minimum for each x
    for x = x_range
        % Iterate over the range of y values for each x
        for y = y_range
            % Evaluate the function for the current x and y
            current_fval = f(x, y);

            % Update optimal x, y, and minimum function value if needed
            if current_fval < min_fval
                min_fval = current_fval;
                optimal_x = x;
                optimal_y = y;
            end
        end
    end
end
