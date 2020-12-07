function [V1, V2, V3, V4, V, Vshowoff] = HW3_2(N)
% HW3_2 returns a "N times N" multiplication table.
%
% Syntax:
%   [V1] = HW3_2(N)
%   [V1, V2, V3, V4, V, Vshowoff] = HW3_2(N)
%   [...] = HW3_2(N)
%
% Inputs:
%   A scalar which is a positive intger.
%
% Outputs:
%   Multiplication tables cretaed by different methods
%
% Examples
%   [V1, V2, V3, V4] = HW3_2(6);
%   [V1, V2, V3, V4, V, Vshowoff] = HW3_2(4);
% 
%   Vshowoff:
%      _______________________________________________________ 
%     |             |             |             |             |
%     |  1 * 1 =  1 |  2 * 1 =  2 |  3 * 1 =  3 |  4 * 1 =  4 |
%     |_____________|_____________|_____________|_____________|
%     |             |             |             |             |
%     |  1 * 2 =  2 |  2 * 2 =  4 |  3 * 2 =  6 |  4 * 2 =  8 |
%     |_____________|_____________|_____________|_____________|
%     |             |             |             |             |
%     |  1 * 3 =  3 |  2 * 3 =  6 |  3 * 3 =  9 |  4 * 3 = 12 |
%     |_____________|_____________|_____________|_____________|
%     |             |             |             |             |
%     |  1 * 4 =  4 |  2 * 4 =  8 |  3 * 4 = 12 |  4 * 4 = 16 |
%     |_____________|_____________|_____________|_____________|

% -------------------------------------------------------------------------
% Author: wfH
% -------------------------------------------------------------------------

V1 = demo1(N); % fast

V2 = demo2(N); % 

V3 = demo3(N); % 

V4 = demo4(N); % fast

V = num2cell(V1); % "num2cell", a builtin function to convert numeric array to cell array with consistently sized cells
Nstr = sprintf('%g',N); % "sprintf", a builtin function to format data into string (characters).
V{1} = [Nstr, ' X ', Nstr];

% Advanced skill
% For-Loop can be replaced by the folloing 2 lines (more efficient)
A = (1:N).*ones(N);
Vshowoff = arrayfun(@(X, Y, Z) sprintf('%2g *%2g =%3g', X, Y, Z), A, A', A.*A','uni', 0);

end


%% 參考解答1
function V = demo1(N)
row = [1, 1:N];
col = row';
V = col * row;
V(1) = 0;
end

%% 參考解答2
function V = demo2(N)
row = (0:N);
tmp = [1, zeros(1, N)];
V = row' * row + tmp' * row + row' * tmp; % 矩陣運算
end

%% 參考解答3
function OO = demo3(K)
row = 1:K;
col = row';
TABLE = col * row;
TABLE = [col, TABLE];
OO = [[0, row]; TABLE];
end

%% 參考解答4
function TABLE = demo4(K)
row = 0:K;
col = row';
TABLE = col * row;
TABLE(1, :) = row;
TABLE(:, 1) = col;
end
