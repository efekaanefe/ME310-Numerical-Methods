
A = [2 -1 1; 1 1 -1; 3 2 1];
b = [5; 0; 9];

x = cramer(A, b);

disp('Solution:');
disp(x);


function x = cramer(A, b)
    [m, n] = size(A);
    if m ~= n
        error('Matrix A must be square');
    end

    if abs(det(A)) < eps
        error('Matrix A is singular (non-invertible)');
    end

    x = zeros(n, 1);

    for i = 1:n
        % Replace the i-th column of A with b
        Ai = A;
        Ai(:, i) = b;

        % Calculate the solution for variable i using determinant
        x(i) = det(Ai) / det(A);
    end
end
