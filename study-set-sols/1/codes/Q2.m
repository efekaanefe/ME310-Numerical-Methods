% This code performs numerical integration by dividing a given integration interval
% [a,b] into N segments and performing n-th order polynomial integration in each segment.

clc;clear;clearvars; close all 
format long

a = 0;       
b = 1;
f = @(x) sin(x)./(1+x);  

a = 0;       
b = 2.2;
f = @(x) sin(x).^3.*cos(x);

N = 2;       
exact = integral(f, a, b);   
n = 4;          

true_errors = zeros(7,1);
index_ = 1;
while N<=128 % loop over various total number of segments
    h = (b-a)/N;    
    Sum = 0;    
    for i = 1:N   % Loop over segments
       % Sub-interval x-values and corresponding y values, (discrete data)
       x = linspace(a + h*(i-1), a + h*i, n+1);
       y = f(x);
       % Calculating coef-vector for sub-interval
       A = flip(polyfit(x,y,n)); % coefficients, order matters
       % Calculate the area under the polynomial p(x)
       Area = 0;
       for j = 1:n+1
          Area = Area + A(j) / j * (x(end)^j - x(1)^j);
       end
       Sum = Sum + Area;
    end
    error = abs(Sum - exact);
    fprintf('N = %d: True Error = %.20e\n', N, error);

    % error log
    true_errors(index_) = error;
    index_ = index_ +1;
    N = N*2;
end


% Plot N vs Error
N = [2, 4, 8, 16, 32, 64, 128];

figure;
loglog(N, true_errors, 'o-', 'LineWidth', 1.5);
xlabel('N');
ylabel('True Error');
title('True Error vs N');
grid on;

% Fit a linear regression line to the data
p = polyfit(log(N), log(true_errors), 1);
slope = p(1); % Slope of the linear regression line

% Add the linear regression line to the plot
hold on;
loglog(N, exp(p(2)) * N.^slope, '--', 'Color', 'red', 'LineWidth', 1.5);
legend('Data', 'Linear Fit', 'Location', 'Best');
hold off;

% Display the slope
fprintf('Slope of the linear fit: %.2f\n', slope);

