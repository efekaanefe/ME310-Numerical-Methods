function [t, y] = heuns_method(f, t0, y0, h, n)

    t = zeros(n+1, 1);
    y = zeros(n+1, 1);

    t(1) = t0;
    y(1) = y0;

    for i = 1:n
        t(i+1) = t(i) + h;
        y_predict = y(i) + h * f(t(i), y(i));
        y(i+1) = y(i) + (h / 2) * (f(t(i), y(i)) + f(t(i+1), y_predict));
    end
end
