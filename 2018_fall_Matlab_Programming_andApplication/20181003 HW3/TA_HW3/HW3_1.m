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

% addpath(genpath(fileparts(cd))); % �]�w�ɮ׸��|

S = [varargin{:}]; % ���X�Ҧ���J�޼�(cell) �Ʀ� 1-by-N array

SS = S * S'; % �V�q���k,��%

% TT = trace(S'*S); % �̺C, ������
% 
% PP = dot(S, S); % �V�q���n % �t�״��q
% 
% QQ = sum(S.^2); % �t�ק� % .^ ��ܹ�Ҧ�element�U�۰����ƹB��; �P�z, .*��ܹ�Ҧ�element�U�۰����k�B��
% 
% EE = sumsqr(S);  % ���إ���M, �t�״��q

m = min(S);


%% �`�����~
function [out, varargout] = SQSO(varargin) % �禡�W�ٻP�ɦW���@�P, �~��varargout
S = [varargin{:}];
SS = sum(S.^2);
m = min(S);
out = {SS, m}; % ����X����ܼ�
