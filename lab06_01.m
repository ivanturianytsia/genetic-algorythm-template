% x = [
%     1, 20, 2; 
%     2, 15, 2; 
%     3, 35, 1; 
%     4, 40, 1; 
%     5, 15, 1; 
%     6, 15, 1; 
%     7, 10, 1]

n_bits = 10;
pop_size = 100;
epochs = 100;

% Initial population generation
x = round(rand(pop_size, n_bits));

[x_trained, statistics] = train(x, epochs, 'fitness');

show_statistics(statistics(1, :), statistics(2, :), statistics(3, :), statistics(4, :))