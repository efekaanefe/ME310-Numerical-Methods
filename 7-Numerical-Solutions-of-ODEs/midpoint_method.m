function [t, y] = midpoint_method(f, t0, y0, h, n)

    t = zeros(n+1, 1);
    y = zeros(n+1, 1);

    t(1) = t0;
    y(1) = y0;

    for i = 1:n
        t(i+1) = t(i) + h;
        k1 = f(t(i), y(i));
        k2 = f(t(i) + h/2, y(i) + h/2 * k1);
        y(i+1) = y(i) + h * k2;
    end
end
