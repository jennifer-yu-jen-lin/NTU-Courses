function [Stars,StarsNumber] = HW5_3(k)

Stars = cell(k); % 創造一個nxn的異質陣列

for i = 1:k % 每一列
    for j = k:-1:(k+1-i) % 每一行都從最右邊的位置填起
    Stars(i,j)={'*'};
    end   
end

StarsNumber = 0;
for i = 1:k
    StarsNumber = StarsNumber + i;
end

