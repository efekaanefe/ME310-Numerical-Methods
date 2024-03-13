function root = incremental_search(func, interval, delta_x)
    xmin = interval(1); xmax = interval(2);
    x = xmin;
    root = [];
    
    while x <= xmax
        fx = func(x);
        
        if fx * func(x + delta_x) < 0
            root = [root, x];
        end
        % Move to next point
        x = x + delta_x;
    end
end
