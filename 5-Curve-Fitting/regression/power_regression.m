function y_fit = power_regression(x, y)

    x_log = log(x);
    y_log = log(y);
    
    n = length(x_log);
    X = [ones(n, 1) x_log'];  

    % Solve normal equation: (X'X)c = X'y_log
    coeffs = (X' * X) \ (X' * y_log');
    
    a = exp(coeffs(1));
    b = coeffs(2);

    y_fit = a * x.^b;

end