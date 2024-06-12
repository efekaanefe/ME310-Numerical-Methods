clc; clear; close all;

%% Part A
% Given temperature data
x_data = [0 2 4 6 8];
y_data = [0 2 4 6 8];
T = [100.00 90.00 80.00 70.00 60.00;
     85.00 64.49 53.50 48.15 50.00;
     70.00 48.90 38.43 35.03 40.00;
     55.00 38.78 30.39 27.07 30.00;
     40.00 35.00 30.00 25.00 20.00];

% Point to interpolate
x = 3;
y = 3.2;

% Find the surrounding points for bi-linear interpolation
x1 = 2; x2 = 4;
y1 = 2; y2 = 4;

% Temperatures at the corners
T11 = T(y_data == y1, x_data == x1);
T12 = T(y_data == y2, x_data == x1);
T21 = T(y_data == y1, x_data == x2);
T22 = T(y_data == y2, x_data == x2);

% Perform bi-linear interpolation
T_bilinear = (T11 * (x2 - x) * (y2 - y) + T21 * (x - x1) * (y2 - y) + ...
              T12 * (x2 - x) * (y - y1) + T22 * (x - x1) * (y - y1)) / ...
             ((x2 - x1) * (y2 - y1));

disp(['Bi-linear Interpolated Temperature (red color) at (3, 3.2): ', num2str(T_bilinear)]);

%% Part B
% Define the 9 points for the first bi-quadratic interpolation
x_points_1 = [0,2,4];
y_points_1 = [2,4,6];

% Perform bi-quadratic interpolation
T_biquadratic_1 = biquadratic_interpolation(x_data, y_data, T, x, y, x_points_1, y_points_1);

disp(['Bi-quadratic Interpolated Temperature (blue color) at (3, 3.2): ', num2str(T_biquadratic_1)]);

%% Part C
% Define the 9 points for the first bi-quadratic interpolation
x_points_1 = [2,4,6];
y_points_1 = [2,4,6];

% Perform bi-quadratic interpolation
T_biquadratic_1 = biquadratic_interpolation(x_data, y_data, T, x, y, x_points_1, y_points_1);

disp(['Bi-quadratic Interpolated Temperature (green color) at (3, 3.2): ', num2str(T_biquadratic_1)]);

function T_biquadratic = biquadratic_interpolation(x_data, y_data, T, x, y, x_points, y_points)
    % Form the Vandermonde matrix for the 9 points
    V = zeros(9, 9);
    b = zeros(9, 1);
    idx = 1;
    for i = 1:3
        for j = 1:3
            V(idx, :) = [1, x_points(i), y_points(j), x_points(i)^2, x_points(i)*y_points(j), ...
                         y_points(j)^2, x_points(i)^2 * y_points(j), x_points(i) * y_points(j)^2, ...
                         x_points(i)^2 * y_points(j)^2];
            b(idx) = T(y_data == y_points(j), x_data == x_points(i));
            idx = idx + 1;
        end
    end
    % Solve for the coefficients
    coeffs = V \ b;
    % Evaluate the bi-quadratic polynomial at (x, y)
    T_biquadratic = coeffs' * [1; x; y; x^2; x*y; y^2; x^2*y; x*y^2; x^2*y^2];
end
