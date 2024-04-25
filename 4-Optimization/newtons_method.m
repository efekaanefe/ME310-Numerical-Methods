function   [xmin, fmin] = newtons_method(f, df, x0, tol, maxIter)
    % Initialization
    x = x0;
    iter = 0;

    % Main loop
    while iter < maxIter
        % Update using Newton's formula
        x_new = x - f(x) / df(x);

        % Check for convergence
        if abs(x_new - x) < tol
            x = x_new;
            break;
        end

        % Update x for the next iteration
        x = x_new;
        iter = iter + 1;
    end

    % Display convergence status
    if iter == maxIter
        disp('Maximum number of iterations reached.');
    else
        fprintf('Converged in %d iterations.\n', iter);
    end

    xmin = x;
    fmin = f(x);
end
