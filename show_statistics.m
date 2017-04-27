function show_statistics(max_ff, mean_ff, n_cross, n_mutate)
    epochs = size(max_ff,2);
    
    figure(1);
    subplot(1,2,1);
    plot(1:epochs, mean_ff, 'b', 1:epochs, max_ff, 'r');
    ylabel('Fittnes');
    xlabel('Iterations');
    legend('Mean', 'Max');
    title('Evolution of a population')

    subplot(1,2,2);
    plot(1:epochs, n_cross, 'b',1:epochs, n_mutate, 'r');
    ylabel('N');
    xlabel('Iterations');
    legend('Crossrate', 'Muterate');
    title('Statistic of cross');
end

