function [output] = HW3_2(K)
output={K,K};

for i=1:K ;

    for j=1:K;

        str=[num2str(i),'x',num2str(j),'=',num2str(i*j)];
        output{j,i}=str;
    end
end

end

