function [t, y] = adams_moulton(t0, y0, h, n, method)
    % method: string, 'AM1', 'AM2', 'AM3', 'AM4'

    
    f = @(t, y) -2 * y;
    
    t = linspace(t0, t0 + n*h, n+1);
    y = zeros(n+1, 1);
    y(1) = y0; % 
    
    switch method
        case 'AM1'
            for i = 1:n
                % Implicit equation: y(i+1) = y(i) + h * f(t(i+1), y(i+1))
                max_iterations = 100;
                tol = 1e-6;
                y_guess = y(i) + h * f(t(i+1), y(i)); 
                for j = 1:max_iterations
                    y_new = y(i) + h * f(t(i+1), y_guess);
                    if abs(y_new - y_guess) < tol
                        break;
                    end
                    y_guess = y_new;
                end
                y(i+1) = y_new;
            end
        case 'AM2'
            for i = 1:n
                % Implicit equation: y(i+1) = y(i) + h * (1/2 * f(t(i), y(i)) + 1/2 * f(t(i+1), y(i+1)))
                max_iterations = 100;
                tol = 1e-6;
                y_guess = y(i) + h * (1/2 * f(t(i), y(i)) + 1/2 * f(t(i+1), y(i+1))); 
                for j = 1:max_iterations
                    y_new = y(i) + h * (1/2 * f(t(i), y(i)) + 1/2 * f(t(i+1), y_guess));
                    if abs(y_new - y_guess) < tol
                        break;
                    end
                    y_guess = y_new;
                end
                y(i+1) = y_new;
            end
        case 'AM3'
            for i = 2:n
                % Implicit equation: y(i+1) = y(i) + h * (5/12 * f(t(i-1), y(i-1)) + 8/12 * f(t(i), y(i)) - 1/12 * f(t(i+1), y(i+1)))
                max_iterations = 100;
                tol = 1e-6;
                y_guess = y(i) + h * (5/12 * f(t(i-1), y(i-1)) + 8/12 * f(t(i), y(i)) - 1/12 * f(t(i+1), y(i+1))); 
                for j = 1:max_iterations
                    y_new = y(i) + h * (5/12 * f(t(i-1), y(i-1)) + 8/12 * f(t(i), y(i)) - 1/12 * f(t(i+1), y_guess));
                    if abs(y_new - y_guess) < tol
                        break;
                    end
                    y_guess = y_new;
                end
                y(i+1) = y_new;
            end
        case 'AM4'
            for i = 3:n
                % Implicit equation: y(i+1) = y(i) + h * (9/24 * f(t(i-2), y(i-2)) + 19/24 * f(t(i-1), y(i-1)) - 5/24 * f(t(i), y(i)) + 1/24 * f(t(i+1), y(i+1)))
                max_iterations = 100;
                tol = 1e-6;
                y_guess = y(i) + h * (9/24 * f(t(i-2), y(i-2)) + 19/24 * f(t(i-1), y(i-1)) - 5/24 * f(t(i), y(i)) + 1/24 * f(t(i+1), y(i+1))); 
                for j = 1:max_iterations
                    y_new = y(i) + h * (9/24 * f(t(i-2), y(i-2)) + 19/24 * f(t(i-1), y(i-1)) - 5/24 * f(t(i), y(i)) + 1/24 * f(t(i+1), y_guess));
                    if abs(y_new - y_guess) < tol
                        break;
                    end
                    y_guess = y_new;
                end
                y(i+1) = y_new;
            end
        otherwise
            error('Invalid method. Choose from ''AM1'', ''AM2'', ''AM3'', or ''AM4''.');
    end
end
