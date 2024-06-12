function y_fit = linear_interpolation(x, y, x_fit)
    if length(x) ~= length(y)
        error('The number of x and y coordinates must be the same.');
    end
    
    n = length(x);
    m = length(x_fit);
    
    y_fit = zeros(1, m);
    
    for k = 1:m
        x_val = x_fit(k);
        % Find the nearest data points
        idx = find(x <= x_val, 1, 'last');
        if isempty(idx)
            idx = 1;
        end
        if idx == n
            idx = n - 1;
        end
        % Linear interpolation
        y_fit(k) = y(idx) + (y(idx+1) - y(idx)) / (x(idx+1) - x(idx)) * (x_val - x(idx));
    end
end
