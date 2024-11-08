function [x, L, U] = lu_decomposition(A, b)
   [m, n] = size(A);

   if m ~= n
        error('Matrix A must be square');
   end

   L = eye(n); % Initialize L as identity matrix
   U = A;      % Initialize U as A

   % Forward elimination
   for k=1:n-1
       if abs(U(k, k)) < eps
           error('Zero pivot encountered. LU decomposition failed.');
       end

       for i = k+1:n
           factor = U(i, k) / U(k, k);
           L(i, k) = factor; % Store the factor in L matrix
           U(i, k:n) = U(i, k:n) - factor * U(k, k:n);
       end
   end

   % Solve Ly = b using forward substitution
    y = zeros(n, 1);
    for i = 1:n
        y(i) = (b(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i);
    end
    
    % Solve Ux = y using backward substitution
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
    end
end


% % Perform LU decomposition:
% for k = 1 to n-1 do
%     if abs(U(k, k)) < eps then
%         raise error: "Zero pivot encountered. LU decomposition failed."
%     end
% 
%     for i = k+1 to n do
%         factor = U(i, k) / U(k, k)
%         L(i, k) = factor
%         U(i, k:n) = U(i, k:n) - factor * U(k, k:n)
%     end
% end
% 
% % Solve Ly = b using forward substitution:
% Initialize y as an n x 1 vector of zeros
% for i = 1 to n do
%     y(i) = (b(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i)
% end
% 
% % Solve Ux = y using backward substitution:
% Initialize x as an n x 1 vector of zeros
% for i = n to 1 do
%     x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i)
% end
% Return x
