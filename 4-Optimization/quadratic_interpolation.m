function [xmin, fmin] = quadratic_interpolation(f, a, b, tol,maxIter)
     % Maximum number of iterations

    % Initial points
    x1 = a;
    x2 = (a + b) / 2;
    x3 = b;

    % Perform quadratic interpolation
    for iter = 1:maxIter
        % Compute function values
        f1 = f(x1);
        f2 = f(x2);
        f3 = f(x3);

        % Compute the parabolic minimum
        denom = (x2 - x1) * (x3 - x1) * (x3 - x2);
        A = (x3 * (f2 - f1) + x2 * (f1 - f3) + x1 * (f3 - f2)) / denom;
        B = (x3^2 * (f1 - f2) + x2^2 * (f3 - f1) + x1^2 * (f2 - f3)) / denom;
        xmin = 0.25 * (x1 + x3 - B / A);
        fmin = f(xmin);

        % Check convergence
        if abs(fmin) < tol
            break;
        end

        % Update interval
        if xmin < x2
            if fmin < f2
                x3 = x2;
                x2 = xmin;
            else
                x1 = xmin;
            end
        else
            if fmin < f2
                x1 = x2;
                x2 = xmin;
            else
                x3 = xmin;
            end
        end
    end

    % Display convergence status
    if iter == maxIter
        disp('Maximum number of iterations reached.');
    else
        fprintf('Converged in %d iterations.\n', iter);
    end
end