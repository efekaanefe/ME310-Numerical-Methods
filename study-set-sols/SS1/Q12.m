clc; clear;
% Given point
a = 0.6;
b = 0.5;

% Given point for evaluation
x = 0.62;
y = 0.48;

% Calculate the function and its derivatives at the given point
f_at_ab = 2*sin(a) + cos(b);
df_dx_at_ab = 2*cos(a);
df_dy_at_ab = -sin(b);
d2f_dx2_at_ab = -2*sin(a);
d2f_dy2_at_ab = -cos(b);
d2f_dxdy_at_ab = 0; % No mixed derivative for these functions

% Calculate the Taylor series expansions
f_0th_order = f_at_ab;
f_1st_order = f_at_ab + df_dx_at_ab * (x - a) + df_dy_at_ab * (y - b);
f_2nd_order = f_1st_order + (1/2) * (d2f_dx2_at_ab * (x - a)^2 + 2*d2f_dxdy_at_ab * (x - a)*(y - b) + d2f_dy2_at_ab * (y - b)^2);

% Evaluate the series at the given point (x, y)
f_0th_order_at_xy = f_0th_order;
f_1st_order_at_xy = f_1st_order;
f_2nd_order_at_xy = f_2nd_order;

% Calculate true errors
true_error_0th_order = abs(f_0th_order_at_xy - (2*sin(x) + cos(y)));
true_error_1st_order = abs(f_1st_order_at_xy - (2*sin(x) + cos(y)));
true_error_2nd_order = abs(f_2nd_order_at_xy - (2*sin(x) + cos(y)));

% Display results in a table
disp('Order   |   Approximation   |   True Error');
disp('-------------------------------------------');
disp(['0th     |   ', num2str(f_0th_order_at_xy), '            |   ', num2str(true_error_0th_order)]);
disp(['1st     |   ', num2str(f_1st_order_at_xy), '            |   ', num2str(true_error_1st_order)]);
disp(['2nd     |   ', num2str(f_2nd_order_at_xy), '            |   ', num2str(true_error_2nd_order)]);