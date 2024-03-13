clc; clear;
format long

N = 100000;
x = single(0:1/N:1);

sum_double_precision = sum(double(x)); % sum in the order generated
sum_single_precision = sum(x);

sorted_sum = sum_increasing_magnitude(x); % sum in the increasing order
sorted_reverse_sum = sum_decreasing_magnitude(x);

disp(['Sum using double-precision accumulator: ', num2str(sum_double_precision)]);
disp(['Sum using single-precision accumulator: ', num2str(sum_single_precision)]);
disp(['Sum in order of increasing magnitude: ', num2str(sorted_sum)]);
disp(['Sum in order of decreasing magnitude: ', num2str(sorted_reverse_sum)]);


function sorted_sum = sum_increasing_magnitude(x)
    [~, idx] = sort(abs(x));
    sorted_sum = sum(x(idx));
end

function sorted_reverse_sum = sum_decreasing_magnitude(x)
    [~, idx] = sort(abs(x), 'descend');
    sorted_reverse_sum = sum(x(idx));
end
