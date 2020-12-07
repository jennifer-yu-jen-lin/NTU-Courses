% HW2_1
% B04B01036 ªL§±¯u

clear
clc

A = { [1 2 ; 4 5] [0 1 2 3] ; 'Name' 'Thank you' };
B = { [A{1,2}]' -3 ; {A{1,1};A{2,1}} A{1,2} };

HW2_1 = cat(3, A, B);

