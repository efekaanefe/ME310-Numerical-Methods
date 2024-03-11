clc; clear;

f = @(x) 2.5./sin(pi-2/3*pi-x) + 2./sin(x); % x->rad 
% fplot(f) % x = 0.44 rad

x = deg2rad(0:0.01:60);
y = f(x);

% finds if the derivative has changed sign
currState = "decreasing";
prevState = currState;
for i=2:size(y,2)
    if y(i-1)<y(i)
        currState = "increasing";
    else
        currState = "decreasing";
    end

    if not (prevState == currState)
        rad2deg(x(i))
        break
    end
    prevState = currState;
end
