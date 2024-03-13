function root = incremental_search(func, interval, delta_x)
    a = interval(1); 
    b = interval(2);
    x = a;
    root = [];
    
    while x <= b
        fx = func(x);
        
        if fx * func(x + delta_x) < 0
            root = [root, x];
        end
        % Move to next point
        x = x + delta_x;
    end
end
