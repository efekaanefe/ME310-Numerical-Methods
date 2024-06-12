function df = backward_difference(x, y)
    if length(x) ~= length(y)
        error('The number of x and y coordinates must be the same.');
    end
    
    n = length(x);
    
    df = zeros(n-1, 1);
    
    for i = 2:n
        df(i-1) = (y(i) - y(i-1)) / (x(i) - x(i-1));
    end
end
