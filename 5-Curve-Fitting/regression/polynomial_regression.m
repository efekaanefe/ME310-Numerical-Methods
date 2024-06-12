function y_fit = polynomial_regression(x, y, degree)

    n = length(x);
    X = ones(n, degree+1);
    for i = 1:degree
        X(:, i + 1) = x'.^i;
    end

    coeffs = (X' * X) \ (X' * y);

    y_fit = X * coeffs;
end
