function x = gaussian_elimination(A, b)
    [m, n] = size(A);
    if m ~= n
        error('Matrix A must be square');
    end
    
    % Augmenting the coefficient matrix A with the right-hand side vector b
    Ab = [A, b];

    % Forward elimination
    for k = 1:n-1
        % Partial pivoting to avoid division by zero
        [~, pivot_row] = max(abs(Ab(k:n, k)));
        pivot_row = pivot_row + k - 1;
        if pivot_row ~= k
            % Swap rows k and pivot_row
            Ab([k, pivot_row], :) = Ab([pivot_row, k], :);
        end
        
        % Elimination step
        for i = k+1:n
            factor = Ab(i, k) / Ab(k, k);
            Ab(i, :) = Ab(i, :) - factor * Ab(k, :);
        end
    end

    % Back substitution
    x = zeros(n, 1);
    x(n) = Ab(n, n+1) / Ab(n, n);
    for i = n-1:-1:1
        x(i) = (Ab(i, n+1) - Ab(i, i+1:n) * x(i+1:n)) / Ab(i, i);
    end
end

% % Forward elimination
% FOR k = 1 TO n-1 DO

%     % Partial pivoting to avoid division by zero
%     pivot_row = k
%     FOR i = k+1 TO n DO
%         IF abs(Ab(i, k)) > abs(Ab(pivot_row, k)) THEN
%             pivot_row = i
%         END IF
%     END FOR

%     IF pivot_row ≠ k THEN
%         Swap rows k and pivot_row in Ab
%     END IF
% 
%     % Elimination step
%     FOR i = k+1 TO n DO
%         factor = Ab(i, k) / Ab(k, k)
%         Ab(i, :) = Ab(i, :) - factor * Ab(k, :)
%     END FOR
% END FOR
% 
% % Back substitution
% x = zeros(n, 1)
% x(n) = Ab(n, n+1) / Ab(n, n)
% FOR i = n-1 DOWNTO 1 DO
%     sum = Ab(i, n+1)
%     FOR j = i+1 TO n DO
%         sum = sum - Ab(i, j) * x(j)
%     END FOR
%     x(i) = sum / Ab(i, i)
% END FOR