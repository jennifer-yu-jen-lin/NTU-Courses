function [Stars,StarsNumber] = HW5_3(k)

Stars = cell(k); % �гy�@��nxn������}�C

for i = 1:k % �C�@�C
    for j = k:-1:(k+1-i) % �C�@�泣�q�̥k�䪺��m��_
    Stars(i,j)={'*'};
    end   
end

StarsNumber = 0;
for i = 1:k
    StarsNumber = StarsNumber + i;
end

