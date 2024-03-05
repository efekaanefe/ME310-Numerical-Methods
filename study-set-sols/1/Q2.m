% METU Mechanical Engineering Department
% ME 310 Numerical Methods
%
% This code performs numerical integration by dividing a given integration interval
% [a,b] into N segments and performing n-th order polynomial integration in each
% segment.
%
% Author : Cuneyt Sert
% Date : 26.02.2024

tic

clc         % Clear the command window
clearvars   % Clear previosuly defined variables

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% User inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = 0;       % Lower limit of the integral
b = 1;       % Upper limit of the integral
N = 50;       % Number of intervals
f = @(x) sin(x)./(1+x);      % Function to be integrated. In MATLAB, this is called
                             % an anonymous function definition.

                           
exact = 0.284226985512411;   % Exact value can be obtained using MATLAB's built-in
                             % numerical integration function called 'integral',
                             % You can use it in the command window as follows
                             % integral(@(x) sin(x)./(1+x), 0, 1)

h = (b-a)/N;    % Constant interval width

n = 3;          % Polynomial order                
 
Sum = 0;        % Integral sum

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

format long
Sum
error = Sum - exact

toc