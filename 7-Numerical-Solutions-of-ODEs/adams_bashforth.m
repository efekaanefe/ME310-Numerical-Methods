function [t, y] = adams_bashforth(f, t0, y0, h, n, method)

    %   method: string, 'AB1', 'AB2', 'AB3', 'AB4'
    
    t = linspace(t0, t0 + n*h, n+1);
    y = zeros(n+1, 1);
    y(1) = y0;
    
    switch method
        case 'AB1'
            for i = 1:n
                y(i+1) = y(i) + h * f(t(i), y(i));
            end
        case 'AB2'
            for i = 1:n
                if i == 1
                    y(i+1) = y(i) + h * f(t(i), y(i));
                else
                    y(i+1) = y(i) + h * (1.5 * f(t(i), y(i)) - 0.5 * f(t(i-1), y(i-1)));
                end
            end
        case 'AB3'
            for i = 1:n
                if i == 1
                    y(i+1) = y(i) + h * f(t(i), y(i));
                elseif i == 2
                    y(i+1) = y(i) + h * (1.5 * f(t(i), y(i)) - 0.5 * f(t(i-1), y(i-1)));
                else
                    y(i+1) = y(i) + h * (23/12 * f(t(i), y(i)) - 4/3 * f(t(i-1), y(i-1)) + 5/12 * f(t(i-2), y(i-2)));
                end
            end
        case 'AB4'
            for i = 1:n
                if i == 1
                    y(i+1) = y(i) + h * f(t(i), y(i));
                elseif i == 2
                    y(i+1) = y(i) + h * (1.5 * f(t(i), y(i)) - 0.5 * f(t(i-1), y(i-1)));
                elseif i == 3
                    y(i+1) = y(i) + h * (23/12 * f(t(i), y(i)) - 4/3 * f(t(i-1), y(i-1)) + 5/12 * f(t(i-2), y(i-2)));
                else
                    y(i+1) = y(i) + h * (55/24 * f(t(i), y(i)) - 59/24 * f(t(i-1), y(i-1)) + 37/24 * f(t(i-2), y(i-2)) - 9/24 * f(t(i-3), y(i-3)));
                end
            end
        otherwise
            error('Invalid method. Choose from ''AB1'', ''AB2'', ''AB3'', or ''AB4''.');
    end
end
