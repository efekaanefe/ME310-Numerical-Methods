function [t, y] = rk4_method(f, t0, y0, h, n)
    % Fourth-order Runge-Kutta (RK4) method 

    t = zeros(n+1, 1);
    y = zeros(n+1, 1);

    t(1) = t0;
    y(1) = y0;

    for i = 1:n
        t(i+1) = t(i) + h;
        k1 = h * f(t(i), y(i));
        k2 = h * f(t(i) + h/2, y(i) + k1/2);
        k3 = h * f(t(i) + h/2, y(i) + k2/2);
        k4 = h * f(t(i) + h, y(i) + k3);
        y(i+1) = y(i) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
    end
end
