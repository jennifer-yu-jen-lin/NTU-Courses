function [OddSS,EvenRank] = HW5_1(M)

% 確定input M不論為幾個維度皆可運算： 
Dimensions = length(size(M)); % 檢查這個矩陣有幾個維度
Total = 1;
for d = 1:Dimensions
    Total = Total*size(M,d); % 依照這個矩陣每個維度的長度，計算這個矩陣的大小，算出整個矩陣共有幾個數
end

OddSS = 0;
EvenRank = [];
for i = 1:Total
    R = mod(M(i),2); % 檢查每個數除以2的餘數
    
    % Odd
    if R == 1 % 若餘數為1，代表為奇數
        OddSS = OddSS + M(i)^2 ; 
    
    % Even
    else % 其他皆為偶數
        EvenRank = [EvenRank,M(i)]; % 將input多維矩陣M中的每個數，依序入這個一維矩陣EvenRank
        EvenRank = sort(EvenRank); % sort的原始設定會將序列由小排至大。若需由大排至小，可使用sort(EvenRank,'descend')
        
    end
        
end

