function res = onebit(dw)
% function to introduce 1 bit error in codeword

[a b] = size(dw);

% first error generated
for i = 1:b
    temp = dw;
    if(dw(i)==0)
        temp(i)=1;
    else
        temp(i)=0;
    end
    
    res(i,:)=temp;  
        
        
end

