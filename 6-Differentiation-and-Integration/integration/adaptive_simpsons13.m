function integral = adaptive_simpsons13(f, a, b, tol)

    function [integral, evals] = adaptive_simpsons_recursive(f, a, b, tol, fa, fb, fm, S)
        c = (a + b) / 2;
        h = (b - a) / 2;
        d = (a + c) / 2;
        e = (c + b) / 2;
        fd = f(d);
        fe = f(e);
        
        % Simpson's rule for the left and right intervals
        Sleft = (h / 6) * (fa + 4 * fd + fm);
        Sright = (h / 6) * (fm + 4 * fe + fb);
        S2 = Sleft + Sright;
        
        % Check if the approximation is within the tolerance
        if abs(S2 - S) < 15 * tol
            integral = S2 + (S2 - S) / 15;
            evals = 2;
        else
            % Recursively apply to the left and right intervals
            [left_integral, left_evals] = adaptive_simpsons_recursive(f, a, c, tol/2, fa, fm, fd, Sleft);
            [right_integral, right_evals] = adaptive_simpsons_recursive(f, c, b, tol/2, fm, fb, fe, Sright);
            integral = left_integral + right_integral;
            evals = left_evals + right_evals + 2;
        end
    end

    % Initial function evaluations
    fa = f(a);
    fb = f(b);
    fm = f((a + b) / 2);
    
    % Initial Simpson's rule approximation
    S = ((b - a) / 6) * (fa + 4 * fm + fb);
    
    % Call the recursive function
    [integral, ~] = adaptive_simpsons_recursive(f, a, b, tol, fa, fb, fm, S);
end
