function y_fit = linear_regression(x, y)

    % n = size(x, 2);
    % a1 = (n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.^2)-sum(x)^2);
    % a0 = mean(y) - a1 * mean(x); 
    % y_pred = a1*x+a0;



    % Z*a = b -> Z.T * Z * a = Z.T * b -> solve for a vector
    n = length(x);
    X = [ones(n, 1), x];

    beta = (X' * X) \ (X' * y); % 

    c = beta(1); m = beta(2);

    fprintf('Intercept (c): %.4f\n', c);
    fprintf('Slope (m): %.4f\n', m);

    y_fit = X * beta;
end
