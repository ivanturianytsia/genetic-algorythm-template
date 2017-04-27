function [ff] = fitness(x)
    % x = [1 1 1;0 1 0]
    dec_x = [];
    pop_size = size(x, 1);
    ch_size = size(x, 2);
    for i = 1:pop_size
        dec_x(i) = bi2de(x(i,:)) / 2^ch_size;
    end
    ff = dec_x.^10;
end

