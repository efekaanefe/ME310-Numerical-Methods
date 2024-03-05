clc; clear;
%% hyper-parameters
x = 10;
true_value = exp(-x);
n_max = 100;
%% init results
% results for eqn1 and eqn2
double_result_1 = 0;
double_result_2 = 0;
single_result_1 = single(0);
single_result_2 = single(0);
%% calculations
% Eq1, for double and single
for k = 0:n_max-1
    double_result_1 = double_result_1 + (-1)^k * (x^k / factorial(k));
    single_result_1 = single_result_1 + (-1)^k * (x^k / factorial(k));
end

% Eq2, for double and single
for k = 0:n_max-1
    double_result_2 = double_result_2 + (x^k / factorial(k));
    single_result_2 = single_result_2 + (x^k / factorial(k));
end
double_result_2 = 1/double_result_2;
single_result_2 = 1/single_result_2;

%% printing
% true_value
% 
% double_result_1 
% single_result_1 
% 
% double_result_2
% single_result_2

error_single_2 = true_value-double_result_2 
error_single_1 = true_value-single_result_2