function [output] = HW3_1(varargin)
A = [varargin{:}];
SumOfSquare = sum(A.^2);
Minimum = min(A);
output=[SumOfSquare, Minimum];
end

