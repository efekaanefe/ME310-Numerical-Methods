clc; clear;



%% Differentiation Methods (using data points)
x = [1, 2, 3, 4, 5]';
y = x.^2;  % Example: y = x^2


df_forward = forward_difference(x, y);
fprintf('Forward difference:\n');
disp(df_forward);

df_backward = backward_difference(x, y);
fprintf('Backward difference:\n');
disp(df_backward);

df_central = central_difference(x, y);
fprintf('Central difference:\n');
disp(df_central);

%% (using function definitions)
f = @(x) x.^2;
x = 2;
h = 0.01;

df_forward = forward_difference_func(f, x, h);
fprintf('Forward difference: %f\n', df_forward);

% Compute the backward difference
df_backward = backward_difference_func(f, x, h);
fprintf('Backward difference: %f\n', df_backward);

% Compute the central difference
df_central = central_difference_func(f, x, h);
fprintf('Central difference: %f\n', df_central);


function df = forward_difference_func(f, x, h)    
    df = (f(x + h) - f(x)) / h;
end

function df = backward_difference_func(f, x, h)   
    df = (f(x) - f(x - h)) / h;
end

function df = central_difference_func(f, x, h)
    df = (f(x + h) - f(x - h)) / (2 * h);
end