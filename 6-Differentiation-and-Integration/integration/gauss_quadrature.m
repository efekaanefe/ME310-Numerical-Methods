function integral = gauss_quadrature(f, a, b, n)

    % Get the nodes and weights for the standard interval [-1, 1]

    % Initialize the coefficients for the Legendre polynomial
    beta = 0.5 ./ sqrt(1 - (2*(1:n-1)).^(-2));
    T = diag(beta, 1) + diag(beta, -1);
    
    % Compute the eigenvalues and eigenvectors
    [V, D] = eig(T);
    
    % The nodes are the eigenvalues
    nodes = diag(D);
    
    % The weights are the square of the first component of the eigenvectors
    weights = 2 * (V(1, :).^2)';

    % Transform nodes to the interval [a, b]
    t = (b - a) / 2;
    c = (b + a) / 2;
    x = t * nodes + c;
    
    integral = t * sum(weights .* f(x));
end

