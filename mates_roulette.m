function [ parents ] = mates_roulette(x, ff)
    pop_size = size(x, 1);
    n_bits = size(x, 2);
    
    % Calculate probabilities based on fitness
    prob = ff / sum(ff);

    % Choose most fit chromosomes to be parents of new generation
    parents = [];
    for i = 1:pop_size
        % Random number to get a chromosome by probability
        shot = rand(1);
        % Find a gap, where random shot gets to, order of gap => index of
        % chromosome
        c = 0;
        for j = 1:pop_size
            c = c + prob(j);
            if shot <= c
                parents(i,:) = x(j,:);
                break;
            end
        end
    end

end

