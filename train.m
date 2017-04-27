function [x_trained, statistics] = train(x, epochs, fitness_function)
    % Hyperparameters
    n_bits = size(x, 2);
    n_param = 1;
    pop_size = size(x, 1);
    crossrate = 0.5;
    muterate = 0.5;

    % Statistics
    m = zeros(1, epochs);
    averages = zeros(1, epochs);
    n_crossed = zeros(1, epochs);
    n_mutated = zeros(1, epochs);
    
    x_trained = x;
   
    for e = 1:epochs
        % Calculate fitness
        ff = feval(fitness_function, x_trained);

        % Choose most fit chromosomes to be parents of new generation
        parents = mates_roulette(x_trained, ff);

        % Shuffle parents to form pairs
        pairs = parents(randperm(pop_size), :);

        % Cross
        crossed = 0;
        mutated = [];
        for i = 1:2:((pop_size) / 2) + 2
            % find out if pairs should cross
            should_cross = rand(1) >= crossrate;
            if should_cross
                crossed = crossed + 1;

                % Mutation
                mutated1 = 0;
                for j = 1:n_bits
                    % find out if bits should mutate
                    should_mutate = rand(1) >= muterate;

                    if should_mutate
                        mutated1 = mutated1 + 1;
                        b1 = pairs(i, j);
                        pairs(i, j) = pairs(i + 1, j);
                        pairs(i + 1, j) = b1;
                    end

                end
                mutated(size(mutated,2) + 1) = mutated1;
            end
        end

        % Assign results to new generation
        x_trained = pairs;

        statistic_ff = feval(fitness_function, x_trained);
        % Get max fit
        m(1, e) = max(statistic_ff);
        % Get average fit
        averages(1, e) = mean(statistic_ff);
        % Save cross rate
        n_crossed(1, e) = crossed;
        % Save mute rate
        n_mutated(1, e) = mean(mutated);
    end

    statistics = [
        m;
        averages;
        n_crossed;
        n_mutated];
end

