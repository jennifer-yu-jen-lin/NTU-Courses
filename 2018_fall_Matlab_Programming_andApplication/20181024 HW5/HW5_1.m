function [OddSS,EvenRank] = HW5_1(M)

% �T�winput M���׬��X�Ӻ��׬ҥi�B��G 
Dimensions = length(size(M)); % �ˬd�o�ӯx�}���X�Ӻ���
Total = 1;
for d = 1:Dimensions
    Total = Total*size(M,d); % �̷ӳo�ӯx�}�C�Ӻ��ת����סA�p��o�ӯx�}���j�p�A��X��ӯx�}�@���X�Ӽ�
end

OddSS = 0;
EvenRank = [];
for i = 1:Total
    R = mod(M(i),2); % �ˬd�C�Ӽư��H2���l��
    
    % Odd
    if R == 1 % �Y�l�Ƭ�1�A�N���_��
        OddSS = OddSS + M(i)^2 ; 
    
    % Even
    else % ��L�Ҭ�����
        EvenRank = [EvenRank,M(i)]; % �Ninput�h���x�}M�����C�ӼơA�̧ǤJ�o�Ӥ@���x�}EvenRank
        EvenRank = sort(EvenRank); % sort����l�]�w�|�N�ǦC�Ѥp�Ʀܤj�C�Y�ݥѤj�Ʀܤp�A�i�ϥ�sort(EvenRank,'descend')
        
    end
        
end

