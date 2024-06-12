function y_fit = newton_interpolating_polynomial(x, y, x_fit)

    if length(x) ~= length(y)
        error('The number of x and y coordinates must be the same.');
    end
    
    n = length(x) - 1;  % Degree of interpolating polynomial
    
    F = zeros(n+1, n+1);
    F(:,1) = y';
    
    % Calculate divided differences
    for j = 2:n+1
        for i = 1:n+1-j+1
            F(i,j) = (F(i+1,j-1) - F(i,j-1)) / (x(i+j-1) - x(i));
        end
    end
    
    m = length(x_fit);
    y_fit = zeros(1, m);
    
    for k = 1:m
        x_val = x_fit(k);
        y_fit(k) = F(1,1);
        for j = 2:n+1
            term = F(1,j);
            for i = 1:j-1
                term = term * (x_val - x(i));
            end
            y_fit(k) = y_fit(k) + term;
        end
    end
end
