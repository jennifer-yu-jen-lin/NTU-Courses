function [SS, m] = HW3_1(varargin)
% HW3_1 Calculating sum of squared value and smallest value of all input arguments
%
% Syntax:
%   [SquareValue] = HW3_1(varargin)
%   [SquareValue, MinValue] = HW3_1(varargin)
%
% Inputs:
%   Any number of input arguments, which are numeric.
%
% Outputs:
%   SS: the sum of squared value of input array
%   m: the smallest value in input array
%
% Examples:
%   [ss] = HW3_1(1,2,pi,-4)
%   [ss, st] = HW3_1(9,0,4,-4)
%   [~, st] = HW3_1(-5,1,4,1:3)
%
% See also varargin
% -------------------------------------------------------------------------
% Author: wfH
% -------------------------------------------------------------------------

% addpath(genpath(fileparts(cd))); % 設定檔案路徑

S = [varargin{:}]; % 取出所有輸入引數(cell) 排成 1-by-N array

SS = S * S'; % 向量乘法,快%

% TT = trace(S'*S); % 最慢, 不推薦
% 
% PP = dot(S, S); % 向量內積 % 速度普通
% 
% QQ = sum(S.^2); % 速度快 % .^ 表示對所有element各自做指數運算; 同理, .*表示對所有element各自做乘法運算
% 
% EE = sumsqr(S);  % 內建平方和, 速度普通

m = min(S);


%% 常見錯誤
function [out, varargout] = SQSO(varargin) % 函式名稱與檔名不一致, 誤用varargout
S = [varargin{:}];
SS = sum(S.^2);
m = min(S);
out = {SS, m}; % 應輸出兩個變數
