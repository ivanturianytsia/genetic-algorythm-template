n_bits = 10;
pop_size = 100;
epochs = 100;

% Initial population generation
x = round(rand(pop_size, n_bits));

[x_trained, statistics] = train(x, epochs, 'fitness');

show_statistics(statistics(1, :), statistics(2, :), statistics(3, :), statistics(4, :))
