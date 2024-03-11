clc; clear;
format long

x_values = [1,0.01, 0.001, 0.0001,0.00001,0.000001,0.0000001];
y_values = [1000,1000,1000,1000,1000,1000,1000];

results_single = zeros(length(x_values), 1, 'single');
results_double = zeros(length(x_values), 1);

for i = 1:length(x_values)
    % single precision
    x = single(x_values(i));
    y = single(y_values(i));
    numerator = (x + y)^2 - (2*x*y + y^2);
    denominator = x^2;
    result_single = numerator / denominator;
    results_single(i) = result_single;

    % double precision
    x = x_values(i);
    y = y_values(i);
    numerator = (x + y)^2 - (2*x*y + y^2);
    denominator = x^2;
    result_double = numerator / denominator;
    results_double(i) = result_double;

end

fprintf('x\t\t\t\t\tSingle Precision\t\t\t\tDouble Precision\n');
fprintf('-----------------------------------------------------------------------\n');
for i = 1:length(x_values)
    fprintf('%.4e\t\t\t%.10e\t\t\t%.16e\n', x_values(i), results_single(i), results_double(i));
end
