function y_fit = exponential_regression(x, y)

    
    y_log = log(y);
    
    n = length(x);
    X = [ones(n, 1) x];  

    % Solve normal equation: (X'X)c = X'y_log
    coeffs = (X' * X) \ (X' * y_log);
    
    a = exp(coeffs(1)); 
    b = coeffs(2);

    y_fit = a * exp(b * x);
end