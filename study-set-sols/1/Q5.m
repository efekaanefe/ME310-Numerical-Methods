clc; 

% Define the value of x
x = 10;

% Define the true value of e^(-10)
true_value = exp(-x);

% Initialize variables to store results and errors

N = 100; % total terms used for calculations

% 2 equations, N terms for each
results_double = zeros(2, N); 
results_single = single(zeros(2, N)); 
errors_double = zeros(2, N);  
errors_single = single(zeros(2, N));  

% Evaluate the expressions using double precision
for n = 1:N
    % Equation 1: Taylor series expansion
    result_double_taylor = 0;
    for k = 0:n
        result_double_taylor = result_double_taylor + (-1)^k * (x^k / factorial(k));
    end
    error_double_taylor = abs(result_double_taylor - true_value) / true_value * 100;
    
    % Equation 2: Alternate series
    result_double_alt = 1 / (1 + x);
    for k = 1:n
        result_double_alt = result_double_alt / (1 + x/k);
    end
    error_double_alt = abs(result_double_alt - true_value) / true_value * 100;
    
    % Store results and errors
    results_double(1, n) = result_double_taylor;
    results_double(2, n) = result_double_alt;
    errors_double(1, n) = error_double_taylor;
    errors_double(2, n) = error_double_alt;
end

% Evaluate the expressions using single precision
for n = 1:100
    % Equation 1: Taylor series expansion
    result_single_taylor = single(0);
    for k = 0:n
        result_single_taylor = result_single_taylor + (-1)^k * (x^k / factorial(k));
    end
    error_single_taylor = abs(result_single_taylor - true_value) / true_value * 100;
    
    % Equation 2: Alternate series
    result_single_alt = 1 / (1 + single(x));
    for k = 1:n
        result_single_alt = result_single_alt / (1 + single(x)/k);
    end
    error_single_alt = abs(result_single_alt - true_value) / true_value * 100;
    
    % Store results and errors
    results_single(1, n) = result_single_taylor;
    results_single(2, n) = result_single_alt;
    errors_single(1, n) = error_single_taylor;
    errors_single(2, n) = error_single_alt;
end

% Display the results and errors
disp('Results and Errors using Double Precision:');
disp('------------------------------------------');
disp('Taylor Series Expansion:');
disp(results_double(1, end));
disp(errors_double(1, end));
disp('Alternate Series:');
disp(results_double(2, end));
disp(errors_double(2, end));


disp('Results and Errors using Single Precision:');
disp('------------------------------------------');
disp('Taylor Series Expansion:');
disp(results_single(1, end));
disp(errors_single(1, end));
disp('Alternate Series:');
disp(results_single(2, end));
disp(errors_single(2, end));
