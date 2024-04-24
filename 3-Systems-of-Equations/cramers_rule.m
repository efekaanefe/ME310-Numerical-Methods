
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

% FOR i = 1 TO size(A, 2) DO
%     Ai ← Copy of A
%     Replace i-th column of Ai with b
%     Calculate x(i) as det(Ai) / det(A)
% END FOR
