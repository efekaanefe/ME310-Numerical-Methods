function y_fit = lagrange_interpolating_polynomial(x, y, x_fit)

    if length(x) ~= length(y)
        error('The number of x and y coordinates must be the same.');
    end
    
    n = length(x);
    m = length(x_fit);
    
    y_fit = zeros(1, m);
    
    for k = 1:m
        x_val = x_fit(k);
        y_fit(k) = 0;
        for i = 1:n
            % Compute the Lagrange basis polynomial for the i-th point
            L = 1;
            for j = 1:n
                if j ~= i
                    L = L * (x_val - x(j)) / (x(i) - x(j));
                end
            end
            % Add the contribution of the i-th point to the interpolated value
            y_fit(k) = y_fit(k) + y(i) * L;
        end
    end
end
