clc; clear;

n_values = 1:10000;
sequence_lengths = zeros(size(n_values));

for i = 1:length(n_values)
    n = n_values(i);
    sequence_length = 1; 
    while n ~= 1
        if mod(n, 2) == 0
            n = n / 2;
        else
            n = 3 * n + 1;
        end
        sequence_length = sequence_length + 1;
    end
    sequence_lengths(i) = sequence_length;
end

scatter(n_values, sequence_lengths, 'filled');
xlabel('n');
ylabel('Sequence Length');
title('Sequence Length vs n');
grid on;

