% B04B01036

function [SumOfSquare, Pyramid] = HW4_1(k)

% SumOfSquare %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SumOfSquare = 0;

for n = 1:k
    Square = n^2;
    SumOfSquare = SumOfSquare + Square;
end

% Pyramid %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pyramid(k, 2*k-1) = 0; % create a matrix filled with zero

for i = 1:k

    Q = floor(i/2); % Q = quotient
    R = rem(i,2); % R = remainder
    
    % fill in all the columns except for the middle one
    for j = 0:Q
        Pyramid(i, k+2*j-1+R) = i;
        Pyramid(i, k-2*j+1-R) = i;
    end
    
    % fill in the middle column
    if (R == 1)
        Pyramid(i,k) = i;
    end
    
end
    

end
